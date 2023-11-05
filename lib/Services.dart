import 'dart:convert';
import 'package:appmovie/models/index.dart';
import 'package:http/http.dart' as http;
import 'models/movie.dart';



class Services {
  static const String url = "http://127.0.0.1:8000";

  static Future<Movies> getMovies() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseMovies(response.body);
      } else {
        return Movies();
      }
    } catch (e) {
      print('Error ${e.toString()})');
      return Movies();
    }
  }

  static Movies parseMovies(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Movie> movies = parsed.map<Movie>((json) => Movies.fromJson(json)).toList();
    Movies m = Movies();
    m.movies = movies;
    return m;
  }






  static const String url1 = "http://127.0.0.1:8000/user";

  static Future<Users> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url1));
      if (200 == response.statusCode) {
        return parseUsers(response.body);
      } else {
        return Users();
      }
    } catch (e) {
      print('Error ${e.toString()})');
      return Users();
    }
  }

  static Users parseUsers(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<User> users = parsed.map<User>((json) => User.fromJson(json)).toList();
    Users u = Users();
    u.users = users;
    return u;
  }


  Future<void> testConnection() async {
  final url = Uri.parse('http://127.0.0.1:8000');
  
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print('Connection successful');
    } else {
      print('Failed to connect. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Failed to connect. Error: $e');
  }
}
}