import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flappy_bird_course/flappy_bird/pages/game_screen.dart';
import 'package:flappy_bird_course/flappy_bird/pages/start_screen.dart';
import 'package:flutter/material.dart';

class OverScreen extends StatefulWidget {
  final FlappyBird game;

  OverScreen({required this.game});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<OverScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Game Over!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                widget.game.overlays.remove('gameOver');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.blue,
                elevation: 5,
                shadowColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Continue',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                onPressed: () {
                  widget.game.overlays.remove('gameOver');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blue,
                  elevation: 5,
                  shadowColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text('Back Flappy Bird'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
