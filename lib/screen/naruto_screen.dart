import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:naruto_flutter/model/naruto_model.dart';

class NarutoScreen extends StatefulWidget {
  const NarutoScreen({super.key});

  @override
  State<NarutoScreen> createState() => _NarutoScreenState();
}

class _NarutoScreenState extends State<NarutoScreen> {
  final listNaruto = ValueNotifier<List<NarutoModel>>([]);
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  Future<void> getHttp() async {
    try {
      final response = await dio.get(
        "https://potterapi-fedeperin.vercel.app/en/characters",
      );
      List<dynamic> data = response.data;

      // Маппим данные в список моделей
      listNaruto.value = data
          .map((e) => NarutoModel.fromJson(e as Map<String, dynamic>))
          .toList();

      // Выводим в консоль для проверки
      for (var character in listNaruto.value) {
        print('Character: ${character.nickname}');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Characters')),
      body: ValueListenableBuilder(
        valueListenable: listNaruto,
        builder: (context, list, child) {
          if (list.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final character = list[index];
              return ListTile(
                leading: Image.network(
                  character.image,
                  width: 50,
                  errorBuilder: (c, e, s) => const Icon(Icons.person),
                ),
                title: Text(character.nickname),
              );
            },
          );
        },
      ),
    );
  }
}
