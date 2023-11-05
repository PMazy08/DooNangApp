import 'package:flutter/material.dart';

class EditMovieScreen extends StatefulWidget {
  const EditMovieScreen({Key? key}) : super(key: key);

  @override
  _EditMovieScreenState createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  String selectedGenre = 'Action'; // Selected genre
  String selectedRating = 'G'; // Selected rating
  TextEditingController nameController = TextEditingController(text: 'Initial Name');
  TextEditingController imageController = TextEditingController(text: 'Initial Image');
  TextEditingController videoController = TextEditingController(text: 'Initial Video');

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
              print('Selected Genre: $selectedGenre');
              print('Selected Rating: $selectedRating');
              print('Title: ${nameController.text}');
              print('Director: ${imageController.text}');
              print('Release Year: ${videoController.text}');
              Navigator.pop(context);
            },
            child: Text('อัพเดท'),
          ),
        ),
      ),
    );
  }
}