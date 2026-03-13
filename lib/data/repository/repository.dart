import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:naruto_flutter/model/naruto_model.dart';

@lazySingleton
class Repository {
  Future<List<NarutoModel>> getHttp() async {
    final box = Hive.box<NarutoModel>("naruto_box");
    try {
      final dio = Dio();
      final response = await dio.get(
          "https://dattebayo-api.onrender.com/characters");
      final List data = response.data["characters"];
      final characters = data.map((e) => NarutoModel.fromJson(e)).toList();
        await box.clear();
        await box.addAll(characters);

      return characters;

    } catch (e) {
      print("Ошибка при загрузке: $e");
      return box.values.toList();
    }
  }
}