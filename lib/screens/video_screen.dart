import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;
  final TextEditingController _commentController = TextEditingController(); // สร้าง Controller สำหรับความคิดเห็น

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'XOQ5kHyzwCk', // รหัสวิดีโอของ YouTube
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  void _submitComment() {
    // นี่คือส่วนที่คุณสามารถดำเนินการกับความคิดเห็น เช่น บันทึกลงฐานข้อมูลหรือส่งไปยังเซิร์ฟเวอร์
    String comment = _commentController.text;
    print("ความคิดเห็น: $comment");

    // เคลียร์ความคิดเห็นหลังจากส่ง
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('Video Screen'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
          
          // กล่องความคิดเห็น
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'ความคิดเห็น',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          // ปุ่มส่งความคิดเห็น
          ElevatedButton(
            onPressed: _submitComment,
            child: Text('ส่งความคิดเห็น'),
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