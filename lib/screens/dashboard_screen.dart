import 'package:appmovie/Services.dart';
import 'package:appmovie/models/movies.dart';
import 'package:appmovie/models/users.dart';
import 'package:appmovie/screens/addmovie_screen.dart';
import 'package:appmovie/screens/editmovie_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {
  late Users users;
  late String title;
  bool isLoading = false;

  @override
  void initState() {
    
    super.initState();
    title = 'Loading users...';
    users = Users();
    isLoading = true;

    Services.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        // title = widget.title;
        isLoading = false;
      });
    });
  }

  

  Widget list(){
  return Expanded(
    child: ListView.builder(
      
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return row(context,index);
      })
    );
  }

  
  Widget row(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
            leading: Image.network('https://i.pinimg.com/236x/bf/d0/f1/bfd0f1e1e2e447c73c88750d49b941d0.jpg'),
            title: Text("The Kingkong"),
            subtitle: Text("Action"),
            trailing: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ];
              },
              onSelected: (String value) {
                if (value == 'edit') {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => EditMovieScreen(),
                    ),
                  );
                } else if (value == 'delete') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete item'),
                        content: Text('Do you want to delete this item?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop(); // ปิด dialog
                            },
                          ),
                          TextButton(
                            child: Text('Ok',style: TextStyle(color: Colors.red)),
                            onPressed: () {
                              // ทำงานที่ต้องการเมื่อกดตกลง
                              Navigator.of(context).pop(); // ปิด dialog
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
            onTap: (){
              // Navigator.push(context,
              //   MaterialPageRoute(
              //     builder: (context) => SlipDetailPage(),
              //   ),
              // );
            },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10,),
            list(),
          ],
        ),
      ),// Adjust the height as needed
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => AddMovieScreen(),
                  ),
                );
        },
        child: Icon(Icons.add), // You can change the icon as needed.
      ), 
    );
  }
}

