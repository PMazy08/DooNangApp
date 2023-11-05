// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies()
  ..movies = (json['movies'] as List<dynamic>)
      .map((e) => Movie.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'movies': instance.movies,
    };
