import 'package:appmovie/screens/video_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  List<String> items = [
    "Home",
    "Explore",
    "Search",
    "Feed",
    "Posts",
    "Activity",
    "Setting",
    "Profile",
    "Profile",
    "Profile",
    "Profile",


  ];

  /// List of body icon
  List<IconData> icons = [
    Icons.home,
    Icons.explore,
    Icons.search,
    Icons.feed,
    Icons.post_add,
    Icons.local_activity,
    Icons.settings,
    Icons.person
  ];
  int current = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        title: Column(
          children: [
            Text(
              "DooNang",
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            /// Tab Bar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              current = index;
                            });
                            pageController.animateToPage(
                              current,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.ease,
                            );
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.all(5),
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              color: current == index
                                  ? Colors.white70
                                  : Colors.white54,
                              borderRadius: current == index
                                  ? BorderRadius.circular(12)
                                  : BorderRadius.circular(7),
                              border: current == index
                                  ? Border.all(
                                      color: Colors.purple,
                                      width: 2.5)
                                  : null,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    items[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),

            /// MAIN BODY
            Container(
              // margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              height: 600,
              child: PageView.builder(
                itemCount: icons.length,
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListView.builder(
                    itemCount: items.length, // เปลี่ยนจำนวนรายการตามที่คุณต้องการ
                    itemBuilder: (context, itemIndex) {
                      return Container(
                        height: 450, // กำหนดความสูงของรายการในแต่ละแท็บ
                        child: Card(
                          margin: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to a new page here, e.g., using MaterialPageRoute.
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => VideoScreen()), // Replace YourNewPage with the page you want to navigate to.
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  'https://i.pinimg.com/236x/bf/d0/f1/bfd0f1e1e2e447c73c88750d49b941d0.jpg'
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "${items[index]} Item $itemIndex",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}