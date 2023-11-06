import 'dart:convert';
import 'package:appmovie/Services.dart';
import 'package:appmovie/models/index.dart';
import 'package:appmovie/screens/video_screen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late Movies movies;
  late Genres genres;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    movies = Movies();
    genres = Genres();

    Services.getMovies().then((moviesFromServer){
      setState(() {
        movies = moviesFromServer;
        isLoading = false;
      });
    });
    Services.getGenres().then((genreFromServer){
      setState(() {
        genres = genreFromServer;
        isLoading = false;
      });
    });
  }

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
        child:isLoading ? const Center(child: CircularProgressIndicator(),)
        :Column(
          children: [
            /// Tab Bar
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: genres.genres == null ? 0 : genres.genres.length,
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
                                    '${genres.genres[index].name_genre}',
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
                itemCount: genres.genres == null ? 0 : genres.genres.length,
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListView.builder(
                    itemCount: movies.movies == null ? 0 : movies.movies.length, // เปลี่ยนจำนวนรายการตามที่คุณต้องการ
                    itemBuilder: (context, itemIndex) {
                      return Container(
                        height: 450, // กำหนดความสูงของรายการในแต่ละแท็บ
                        child: Card(
                          margin: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                                Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => VideoScreen(movie:movies!.movies[itemIndex],),
                                ),
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  '${movies.movies[itemIndex].pic_movie}',
                                width: 200, 
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  "${movies.movies[itemIndex].name_movie}",
                                  // "${movies.movies[1].name_movie}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8), // Add spacing between the two texts
                                Text(
                                  "ประเภท: ${movies.movies[itemIndex].genre}",
                                  style: TextStyle(color: const Color.fromARGB(255, 90, 90, 90), fontWeight: FontWeight.normal),
                                ),
                                SizedBox(width: 8), // Add spacing between the two texts
                                Text(
                                  "เรท: ${movies.movies[itemIndex].rate}",
                                  style: TextStyle(color: const Color.fromARGB(255, 90, 90, 90), fontWeight: FontWeight.normal),
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

