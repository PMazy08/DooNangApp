// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie()
  ..genre = json['genre'] as String
  ..movieId = json['movieId'] as num
  ..name_movie = json['name_movie'] as String
  ..pic_movie = json['pic_movie'] as String
  ..rate = json['rate'] as String
  ..videoLink = json['videoLink'] as String;

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'genre': instance.genre,
      'movieId': instance.movieId,
      'name_movie': instance.name_movie,
      'pic_movie': instance.pic_movie,
      'rate': instance.rate,
      'videoLink': instance.videoLink,
    };
