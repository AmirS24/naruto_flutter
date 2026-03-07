import 'package:json_annotation/json_annotation.dart';

part 'naruto_model.g.dart';

@JsonSerializable()
class NarutoModel {
  final String name;
  final String images;

  NarutoModel(String json, {required this.name,required this.images});

  factory NarutoModel.fromJson(Map<String, dynamic> json) =>
      _$NarutoModelFromJson(json);

  Map<String, dynamic> toJson() => _$NarutoModelToJson(this);
}