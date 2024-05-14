import 'package:flutter/material.dart';

class Texttitel extends StatelessWidget {
  final String title;
  const Texttitel({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 30),
    );
  }
}
