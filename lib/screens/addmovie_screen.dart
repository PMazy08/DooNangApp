import 'dart:convert';

import 'package:appmovie/Services.dart';
import 'package:appmovie/models/index.dart';
import 'package:appmovie/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  late Rates rates;
  late Genres genres;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController videoController = TextEditingController();
  @override
  void initState() {
    super.initState();
    rates = Rates();
    genres = Genres();

    Services.getRates().then((ratesFromServer){
      setState(() {
        rates = ratesFromServer;
      });
    });
    Services.getGenres().then((genreFromServer){
      setState(() {
        genres = genreFromServer;
      });
    });
  }


  String selectedGenre = 'Action'; // Selected genre
  String selectedRating = "G"; // Selected rating
  String name = ''; // Placeholder for the title
  String image = ''; // Placeholder for the director
  String video = ''; // Placeholder for the release year

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
              "เพิ่มหนัง",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child:Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First TextField
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.purple.withOpacity(0.1),
                  filled: true,
                ),
              ),
              // Second TextField
              const SizedBox(height: 20),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  hintText: "Image",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.purple.withOpacity(0.1),
                  filled: true,
                ),
              ),
              // Third TextField
              const SizedBox(height: 20),
              TextField(
                controller: videoController,
                decoration: InputDecoration(
                  hintText: "Video",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.purple.withOpacity(0.1),
                  filled: true,
                ),
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
                    selectedGenre = newValue!; // Update the selected value
                  });
                },
              ),
              // Second Dropdown
              const SizedBox(height: 20),
              DropdownButton<String>(
                hint: Text('Rating'),
                value: selectedRating, // Set the selected value
                items: <String>['G', 'PG', 'PG-13', 'R']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRating = newValue!; // Update the selected value
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
              submitMovie();
              // Navigator.pop(context,);
            },
            child: Text('เพิ่ม'),
          ),
        ),
      ),
    );
  }


  Future<void> submitMovie() async{
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

    final url = 'http://192.168.1.67:8000/insert';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    print(response.statusCode);

    if(response.statusCode == 200){
      print("Succes");
      // showSussSMG("Succes");
      Navigator.pop(context); 
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
                Navigator.pop(context); // Close the dialog
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
