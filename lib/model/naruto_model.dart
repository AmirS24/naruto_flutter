import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'naruto_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class NarutoModel {
  @HiveField(0)
  @JsonKey(name: 'name')
  final String? name;

  @HiveField(1)
  @JsonKey(name: 'images')
  final List<String>? images;

  @HiveField(2)
  final List<String>? jutsu;

  @HiveField(3)
  final dynamic id;

  @HiveField(4)
  final Map<String, dynamic>? family;
  @HiveField(5)
  final Map<String, dynamic>? personal;
  @HiveField(6)
  final Map<String, dynamic>? height;
  @HiveField(7)
  final Map<String, dynamic>? rank;

  NarutoModel({this.name, this.images, this.jutsu, this.family, this.personal, this.height, this.rank, this.id});

  //Map<String, dynamic> toJson() => _$NarutoModelToJson(this);

  String get image => (images != null && images!.isNotEmpty) ? images![0] : '';

  String get blankPeriodHeight{
    if(height != null && height!.containsKey('Blank Period')){
      return height!['Blank Period'].toString();
    }
      return "Unknown";
      }

  String get clan{
    if(personal != null && personal!.containsKey('clan')){
      return personal!["clan"].toString();
    }
    return "No clan";
  }

  String get anyHeight{
    if(height == null || height!.isEmpty) return "Unknown";
    return height!.values.first.toString();
  }

      factory NarutoModel.fromJson(Map<String, dynamic> json) =>
          _$NarutoModelFromJson(json);

      Map<String, dynamic> toJson() => _$NarutoModelToJson(this);
    }

