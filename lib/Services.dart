import 'dart:convert';
import 'package:appmovie/models/index.dart';
import 'package:appmovie/models/movie.dart';
import 'package:appmovie/models/movies.dart';
import 'package:http/http.dart' as http;


class Services{
  static const String url = "http://192.168.1.67:8000";

  static Future<Movies> getMovies() async{
    try {
      final response = await http.get(Uri.parse('$url/movie'));
      if (200 == response.statusCode) {
        return parseMovies(response.body);
      } else {
        return Movies();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Movies();
    }
  }

  static Movies parseMovies(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Movie> movies = parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
    Movies m = Movies();
    m.movies = movies;
    return m;
  }
// ==========================================================

  static Future<User> getUser(String name) async {
    try {
      final response = await http.get(Uri.parse('$url/search_user/$name'));
      if (200 == response.statusCode) {
        return parseUser(response.body);
      } else {
        return User();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return User();
    }
  }

  static User parseUser(String responseBody) {
    final Map<String,dynamic> parsed = json.decode(responseBody);
    return User.fromJson(parsed);
  }
// =======================================================

  static Future<Genres> getGenres() async{
    try {
      final response = await http.get(Uri.parse('$url/select/genre'));
      if (200 == response.statusCode) {
        return parseGenres(response.body);
      } else {
        return Genres();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Genres();
    }
  }

  static Genres parseGenres(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Genre> genres = parsed.map<Genre>((json) => Genre.fromJson(json)).toList();
    Genres g = Genres();
    g.genres = genres;
    return g;
  }
// =========================================================

  static Future<Rates> getRates() async{
    try {
      final response = await http.get(Uri.parse('$url/select/rate'));
      if (200 == response.statusCode) {
        return parseRates(response.body);
      } else {
        return Rates();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Rates();
    }
  }

  static Rates parseRates(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Rate> rates = parsed.map<Rate>((json) => Rate.fromJson(json)).toList();
    Rates r = Rates();
    r.rates = rates;
    return r;
  }
// =================================================================

  static Future<Reviews> getReviews(num id) async{
    try {
      final response = await http.get(Uri.parse('$url/reviews/movie/$id'));
      if (200 == response.statusCode) {
        return parseReviews(response.body);
      } else {
        return Reviews();
      }
    } catch (e) {
      print('Error ${e.toString()}');
      return Reviews();
    }
  }

  static Reviews parseReviews(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Review> reviews = parsed.map<Review>((json) => Review.fromJson(json)).toList();
    Reviews r = Reviews();
    r.reviews = reviews;
    return r;
  }

}