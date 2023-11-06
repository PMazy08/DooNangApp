import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  Review();

  late String comment;
  late num movieId;
  late num reviewsId;
  late num userId;
  
  factory Review.fromJson(Map<String,dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
