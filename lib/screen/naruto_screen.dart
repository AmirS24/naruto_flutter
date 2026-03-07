import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NarutoScreen extends StatefulWidget {
  const NarutoScreen({super.key});

  @override
  State<NarutoScreen> createState() => _NarutoScreenState();
}

class _NarutoScreenState extends State<NarutoScreen> {
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  Future<void> getHttp() async {
    try {
      // 1. Делаем запрос
      final response = await dio.get("https://potterapi-fedeperin.vercel.app/en/characters");
      
      // 2. Получаем данные (это список Map)
      final List<dynamic> data = response.data;

      for (var item in data) {
        print("Имя: ${item['nickname']} | URL: ${item['image']}");
      }
      
    } catch (e) {
      print("Ошибка при загрузке: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Test')),
      body: const Center(
        child: Text('Смотри результат в консоли (Debug Console)'),
      ),
    );
  }
}
