// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'naruto_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NarutoModelAdapter extends TypeAdapter<NarutoModel> {
  @override
  final int typeId = 0;

  @override
  NarutoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NarutoModel(
      name: fields[0] as String?,
      images: (fields[1] as List?)?.cast<String>(),
      jutsu: (fields[2] as List?)?.cast<String>(),
      family: (fields[4] as Map?)?.cast<String, dynamic>(),
      personal: (fields[5] as Map?)?.cast<String, dynamic>(),
      height: (fields[6] as Map?)?.cast<String, dynamic>(),
      rank: (fields[7] as Map?)?.cast<String, dynamic>(),
      id: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, NarutoModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.jutsu)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.family)
      ..writeByte(5)
      ..write(obj.personal)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.rank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NarutoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NarutoModel _$NarutoModelFromJson(Map<String, dynamic> json) => NarutoModel(
      name: json['name'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      jutsu:
          (json['jutsu'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
