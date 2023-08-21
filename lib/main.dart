import 'package:fast_trivia/view/resources/themes.dart';
import 'package:fast_trivia/view/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      home: Home(),
    );
  }
}
