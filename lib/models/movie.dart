import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie();

  late String genre;
  late num movieId;
  late String name_movie;
  late String pic_movie;
  late String rate;
  late String videoLink;
  
  factory Movie.fromJson(Map<String,dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
