import 'package:flutter/material.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  String selectedGenre = 'Action'; // Selected genre
  String selectedRating = 'G'; // Selected rating
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First TextField
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  setState(() {
                    name = value; // Update the title when text changes
                  });
                },
              ),
              // Second TextField
              TextField(
                decoration: InputDecoration(labelText: 'Image'),
                onChanged: (value) {
                  setState(() {
                    image = value; // Update the director when text changes
                  });
                },
              ),
              // Third TextField
              TextField(
                decoration: InputDecoration(labelText: 'Video'),
                onChanged: (value) {
                  setState(() {
                    video = value; // Update the release year when text changes
                  });
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
                    selectedGenre = newValue!; // Update the selected value
                  });
                },
              ),
              // Second Dropdown
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
              print('Selected Genre: $selectedGenre');
              print('Selected Rating: $selectedRating');
              print('Title: $name');
              print('Director: $image');
              print('Release Year: $video');

              Navigator.pop(context,);
            },
            child: Text('เพิ่ม'),
          ),
        ),
      ),
    );
  }
}