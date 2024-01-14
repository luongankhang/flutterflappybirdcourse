import 'package:flappy_bird_course/flappy_bird/pages/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlappyBirdApp());
}

class FlappyBirdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flappy Bird',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
    );
  }
}
