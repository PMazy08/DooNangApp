import 'package:json_annotation/json_annotation.dart';
import "review.dart";
part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  Reviews();

  late List<Review> reviews;
  
  factory Reviews.fromJson(Map<String,dynamic> json) => _$ReviewsFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewsToJson(this);
}
