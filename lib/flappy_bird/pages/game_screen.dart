import 'package:flame/game.dart';
import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flappy_bird_course/flappy_bird/pages/over_screen.dart';
import 'package:flappy_bird_course/flappy_bird/pages/ready_screen.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<GameScreen> {
  late FlappyBird game;

  @override
  void initState() {
    super.initState();
    game = FlappyBird();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: game,
        overlayBuilderMap: {
          'gameReady': (context, _) => ReadyScreen(game: game),
          'gameOver': (context, _) => OverScreen(game: game),
        },
      ),
    );
  }
}
