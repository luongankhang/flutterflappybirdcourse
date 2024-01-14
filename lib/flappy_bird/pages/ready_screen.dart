import 'dart:async';

import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flutter/material.dart';

class ReadyScreen extends StatefulWidget {
  final FlappyBird game;

  ReadyScreen({required this.game});

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<ReadyScreen> {
  var countdown = '3';

  @override
  void initState() {
    super.initState();
    widget.game.pauseEngine();
    startCountdown();
  }

  void startCountdown() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (countdown == '0') {
        timer.cancel();
        widget.game.soundManager.playLetGoSound();
        widget.game.overlays.remove('gameReady');
        widget.game.resumeEngine();
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
      } else {
        widget.game.soundManager.playGetPointSound();
        setState(() {
          int currentCountdown = int.parse(countdown);
          currentCountdown -= 1;
          countdown = currentCountdown.toString();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Ready',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              countdown == '0' ? 'Let go!' : '$countdown',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
