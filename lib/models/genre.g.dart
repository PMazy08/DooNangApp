// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre()
  ..genreId = json['genreId'] as num
  ..name_genre = json['name_genre'] as String;

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'genreId': instance.genreId,
      'name_genre': instance.name_genre,
    };
