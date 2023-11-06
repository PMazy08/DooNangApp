import 'package:appmovie/Services.dart';
import 'package:appmovie/models/index.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  final Movie movie;

  const VideoScreen({Key? key, required this.movie}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  final TextEditingController _commentController = TextEditingController();
  late Reviews reviews;
  bool isLoading = true;
  // Sample list of comments
  List<String> comments = [
    'Comment 1',
    'Comment 2',
    'Comment 3',
  
    // Add more comments as needed
  ];

  @override
  void initState() {
    final id = widget.movie.movieId;
    super.initState();
    isLoading = true;
    reviews = Reviews();
    _controller = YoutubePlayerController(
      initialVideoId: '${widget.movie.videoLink}',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );


    Services.getReviews(id).then((reviewaFromServer){
      setState(() {
        reviews = reviewaFromServer;
        isLoading = false;
      });
    });
  }

  void _submitComment() {
    String comment = _commentController.text;
    // Handle the comment (e.g., save to a database or send to a server)
    // ...

    // Clear the comment input field
    _commentController.clear();
    // Update the list of comments with the new comment
    setState(() {
      comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text(widget.movie.name_movie),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          // List of comments using ListView.builder
          Expanded(
            child: ListView.builder(
              itemCount: reviews.reviews == null ? 0:reviews.reviews.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // title: Text(reviews.reviews[index].userId),
                  subtitle: Text("${reviews.reviews[index].comment}"), // Add your additional text
                );
              },
            ),
          ),
          // Comment input field and submit button
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      labelText: 'แสดงความคิดเห็น',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: _submitComment,
                  child: Text('ส่ง'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}