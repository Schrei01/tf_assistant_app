import 'package:flutter/material.dart';
import 'package:tf_assistant_app/screens/start_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartScreen(),
    );
  }
}