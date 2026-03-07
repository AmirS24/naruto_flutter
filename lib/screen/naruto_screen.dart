import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:naruto_flutter/model/naruto_model.dart';

class NarutoScreen extends StatefulWidget {
  const NarutoScreen ({super.key});

  @override
  State<NarutoScreen> createState() => _NarutoScreenState();
}

class _NarutoScreenState extends State<NarutoScreen> {
  final listNaruto = ValueNotifier<List<NarutoModel>>([]);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
      ),
    );
  }
  final dio = Dio();

  Future<void> getHttp() async {
    try {
      final response = await dio.get("https://potterapi-fedeperin.vercel.app/en/characters");
      List<dynamic> data = response.data;
      listNaruto.value = data.map((e) => NarutoModel(json, name: name, images: images).fromJson(e)).toList();
    } catch (e) {
      print("Error: $e");
    }
  }
}
