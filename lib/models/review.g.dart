// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review()
  ..comment = json['comment'] as String
  ..movieId = json['movieId'] as num
  ..reviewsId = json['reviewsId'] as num
  ..userId = json['userId'] as num;

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'comment': instance.comment,
      'movieId': instance.movieId,
      'reviewsId': instance.reviewsId,
      'userId': instance.userId,
    };
