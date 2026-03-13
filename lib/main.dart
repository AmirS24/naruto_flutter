
import 'package:flutter/material.dart';
import 'package:naruto_flutter/routes/app_router.dart';
import 'package:naruto_flutter/screen/naruto_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/naruto_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(NarutoModelAdapter());
  await Hive.openBox<NarutoModel>('naruto_box');

  final appRouter = AppRouter();

  runApp(
      MaterialApp.router(
        routerConfig: appRouter.config(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: Colors.orange
    ),
  ));
}