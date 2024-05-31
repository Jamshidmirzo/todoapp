import 'package:flutter/material.dart';
import 'package:todoapp/views/screens/homepage.dart';

void main(List<String> args) {
  runApp(Todo());
}

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}
