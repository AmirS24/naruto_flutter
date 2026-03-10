import 'package:json_annotation/json_annotation.dart';

part 'naruto_model.g.dart';

@JsonSerializable()
class NarutoModel {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'images')
  final List<String>? images;

  final List<String>? jutsu;

  final dynamic id;

  final Map<String, dynamic>? family;
  final Map<String, dynamic>? personal;
  final Map<String, dynamic>? height;
  final Map<String, dynamic>? rank;

  NarutoModel({this.name, this.images, this.jutsu, this.family, this.personal, this.height, this.rank, this.id});


  String get image => (images != null && images!.isNotEmpty) ? images![0] : '';

  String get blankPeriodHeight{
    if(height != null && height!.containsKey('Blank Period')){
      return height!['Blank Period'].toString();
    }
      return "Unknown";
      }

  String get clan{
    if(family != null && family!.containsKey('clan')){
      return personal!["clan"].toString();
    }
    return "No clan";
  }

      factory NarutoModel.fromJson(Map<String, dynamic> json) =>
          _$NarutoModelFromJson(json);

      Map<String, dynamic> toJson() => _$NarutoModelToJson(this);
    }

