import 'package:json_annotation/json_annotation.dart';
import "movie.dart";
part 'movies.g.dart';

@JsonSerializable()
class Movies {
  Movies();

  late List<Movie> movies;
  
  factory Movies.fromJson(Map<String,dynamic> json) => _$MoviesFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
