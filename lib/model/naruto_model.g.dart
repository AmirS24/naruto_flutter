// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naruto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NarutoModel _$NarutoModelFromJson(Map<String, dynamic> json) => NarutoModel(
  name: json['name'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  jutsu: (json['jutsu'] as List<dynamic>?)?.map((e) => e as String).toList(),
  family: json['family'] as Map<String, dynamic>?,
  personal: json['personal'] as Map<String, dynamic>?,
  height: json['height'] as Map<String, dynamic>?,
  rank: json['rank'] as Map<String, dynamic>?,
  id: json['id'],
);

Map<String, dynamic> _$NarutoModelToJson(NarutoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'images': instance.images,
      'jutsu': instance.jutsu,
      'id': instance.id,
      'family': instance.family,
      'personal': instance.personal,
      'height': instance.height,
      'rank': instance.rank,
    };
