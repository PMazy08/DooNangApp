import 'dart:convert';
import 'package:appmovie/Services.dart';
import 'package:appmovie/models/index.dart';
import 'package:appmovie/screens/dashboard_screen.dart';
import 'package:appmovie/screens/home_screen.dart';
import 'package:appmovie/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late User user;
  // List item = [];


  @override
  void initState() {
    super.initState();

    Services.getUser("Admit").then((userFromServer){
      setState(() {
        user = userFromServer;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "DooNang",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            hintText: "Username",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Color.fromARGB(255, 156, 39, 176).withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.purple.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // debugPrint('${user.username}');
            final username = usernameController.text;
            final password = passwordController.text;

            // fethMovie(username);

            if (password == "123"){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }
            else{
              Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
            }

          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.purple,
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );
          },
          child: const Text("Sign Up", style: TextStyle(color: Colors.purple)),
        ),
      ],
    );
  }




  //   Future<void> fethMovie(String username) async{
  //   final url = 'http://192.168.1.67:8000/search_user/$username';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   print(response.statusCode);
  //   if(response.statusCode == 200 ){
  //     final json = jsonDecode(response.body) as Map;
  //     final result = json['item'] as List;
  //     setState(() {
  //       item = result;
  //     });
  //   }else{

  //   }

  // }
}