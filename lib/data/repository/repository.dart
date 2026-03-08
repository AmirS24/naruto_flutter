import 'package:dio/dio.dart';

class Repository {
  Future<List<dynamic>> getHttp() async {
    try {
      final dio = Dio();
      final response = await dio.get(
          "https://potterapi-fedeperin.vercel.app/en/characters");
      return response.data;
    } catch (e) {
      print("Ошибка при загрузке: $e");
    }
  }
}