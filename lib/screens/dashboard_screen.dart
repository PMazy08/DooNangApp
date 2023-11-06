import 'package:appmovie/Services.dart';
import 'package:appmovie/models/movies.dart';
import 'package:appmovie/screens/addmovie_screen.dart';
import 'package:appmovie/screens/editmovie_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}


class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = true;
  late Movies movies;


  @override
  void initState() {
    super.initState();
    isLoading = true;
    movies = Movies();

    Services.getMovies().then((moviesFromServer){
      setState(() {
        movies = moviesFromServer;
        isLoading = false;
      });
    });
  }


  Widget list(){
  return Expanded(
    child: ListView.builder(
      
      itemCount: movies.movies == null ? 0 : movies.movies.length,
      itemBuilder: (BuildContext context, int index) {
        return row(context,index);
      })
    );
  }

  
  Widget row(BuildContext context, int index) {
    return Card(
      child:isLoading ? const Center(child: CircularProgressIndicator(),)
        :Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
            leading: Image.network('${movies.movies[index].pic_movie}'),
            title: Text("${movies.movies[index].name_movie}"),
            subtitle: Text("${movies.movies[index].genre}"),
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
                      builder: (context) => EditMovieScreen(movie:movies!.movies[index],),
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
                              final id = movies.movies[index].movieId;
                              deleteById(id);
                              Navigator.of(context).pop();
                              
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen())); // ปิด dialog
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

  Future<void> deleteById(num id) async{
     final url = 'http://192.168.1.67:8000/delete_movie/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    print(response.statusCode);
  }
}

