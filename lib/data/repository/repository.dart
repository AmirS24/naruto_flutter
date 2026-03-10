import 'package:dio/dio.dart';
import 'package:naruto_flutter/model/naruto_model.dart';

class Repository {
  Future<List<NarutoModel>> getHttp() async {
    try {
      final dio = Dio();
      final response = await dio.get(
          "https://dattebayo-api.onrender.com/characters");
      final List data = response.data["characters"];
      return data.map((e) => NarutoModel.fromJson(e)).toList();

    } catch (e) {
      print("Ошибка при загрузке: $e");
      return [];
    }
  }
}