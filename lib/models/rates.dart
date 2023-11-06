import 'package:json_annotation/json_annotation.dart';
import "rate.dart";
part 'rates.g.dart';

@JsonSerializable()
class Rates {
  Rates();

  late List<Rate> rates;
  
  factory Rates.fromJson(Map<String,dynamic> json) => _$RatesFromJson(json);
  Map<String, dynamic> toJson() => _$RatesToJson(this);
}
