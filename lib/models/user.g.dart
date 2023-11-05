// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..pass = json['pass'] as String
  ..role = json['role'] as String
  ..userId = json['userId'] as num
  ..username = json['username'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'pass': instance.pass,
      'role': instance.role,
      'userId': instance.userId,
      'username': instance.username,
    };
