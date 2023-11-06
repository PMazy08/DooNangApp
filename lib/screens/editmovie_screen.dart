import 'dart:convert';

import 'package:appmovie/models/index.dart';
import 'package:appmovie/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditMovieScreen extends StatefulWidget {
  final Movie movie;

  const EditMovieScreen({Key? key, required this.movie}) : super(key: key);

  @override
  _EditMovieScreenState createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  String selectedGenre = 'Action'; // Selected genre
  String selectedRating = 'G'; // Selected rating
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController videoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.movie.name_movie;
    imageController.text = widget.movie.pic_movie;
    videoController.text = widget.movie.videoLink;
  }

  @override
  void dispose() {
    nameController.dispose();
    imageController.dispose();
    videoController.dispose();
    super.dispose();
  }

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
              "แก้ไขหนัง",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First TextField
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: nameController,
                onChanged: (value) {
                  // Handle onChanged
                },
              ),
              // Second TextField
              TextField(
                decoration: InputDecoration(labelText: 'Image'),
                controller: imageController,
                onChanged: (value) {
                  // Handle onChanged
                },
              ),
              // Third TextField
              TextField(
                decoration: InputDecoration(labelText: 'Video'),
                controller: videoController,
                onChanged: (value) {
                  // Handle onChanged
                },
              ),
              // First Dropdown
              DropdownButton<String>(
                hint: Text('Genre'),
                value: selectedGenre, // Set the selected value
                items: <String>['Action', 'Comedy', 'Drama', 'Sci-Fi']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGenre = newValue!;
                  });
                },
              ),
              // Second Dropdown
              DropdownButton<String>(
                hint: Text('Rating'),
                value: selectedRating,
                items: <String>['G', 'PG', 'PG-13', 'R']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRating = newValue!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              // Handle the submit action
              // print('Selected Genre: $selectedGenre');
              // print('Selected Rating: $selectedRating');
              // print('Title: ${nameController.text}');
              // print('Director: ${imageController.text}');
              // print('Release Year: ${videoController.text}');
              // Navigator.pop(context);
              final id = widget.movie.movieId;
              updateMovie(id);
            },
            child: Text('อัพเดท'),
          ),
        ),
      ),
    );
  }



  Future<void> updateMovie(num id) async{
    final name = nameController.text;
    final img = imageController.text;
    final video = videoController.text;
    final body ={
        "genre": 2,
        "name_movie": name,
        "pic_movie": img,
        "rate": 3,
        "videoLink": video
    };

    final url = 'http://192.168.1.67:8000/update/movie/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.statusCode);

    if(response.statusCode == 200){
      print("Succes");
      // showSussSMG("Succes");
      Navigator.pop(context); 
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
    }
    else{
      print("Faild");

      showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Faild"),
          content: Text(""),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                 // Close the dialog
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
    }
  }
}