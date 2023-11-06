// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rates _$RatesFromJson(Map<String, dynamic> json) => Rates()
  ..rates = (json['rates'] as List<dynamic>)
      .map((e) => Rate.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$RatesToJson(Rates instance) => <String, dynamic>{
      'rates': instance.rates,
    };
