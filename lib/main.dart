
import 'package:flutter/material.dart';
import 'package:naruto_flutter/screen/naruto_screen.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        primaryColor: Colors.orange
    ),
    home: NarutoScreen(),
  ));
}