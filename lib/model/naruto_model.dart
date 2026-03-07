import 'package:json_annotation/json_annotation.dart';

part 'naruto_model.g.dart';

@JsonSerializable()
class NarutoModel {
  final String nickname;
  final String image;

  NarutoModel({required this.nickname, required this.image});

  factory NarutoModel.fromJson(Map<String, dynamic> json) =>
      _$NarutoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NarutoModelToJson(this);
}
