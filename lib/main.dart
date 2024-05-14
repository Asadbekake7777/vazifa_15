import 'package:flutter/material.dart';
import 'package:vazifa_15/pages/pages.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "tictaktoe",
      debugShowCheckedModeBanner: false,
      home: StartTicTacToe(),
    );
  }
}
