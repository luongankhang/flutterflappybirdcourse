import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flappy_bird_course/flappy_bird/models/bird_info.dart';
import 'package:flutter/animation.dart';

class Bird extends SpriteComponent
    with HasGameRef<FlappyBird>, CollisionCallbacks {
  double initialHeight = 0;
  double amplitude = 10; // Biên độ của chuyển động lên xuống
  double frequency = 1; // Tần số của chuyển động lên xuống
  double time = 0;
  final double velocity = 300;
  Image? spriteImage;

  Bird();

  @override
  Future<void> onLoad() async {
    await _createObject();
    initialHeight = position.y;
  }

  Future<void> _createObject() async {
    if (BirdInfo.selectedValue == 0) {
      spriteImage = await Flame.images.load('bird.png');
    }
    switch (BirdInfo.selectedValue) {
      case 1:
        spriteImage = await Flame.images.load('birds/red_bird.png');
        break;
      case 2:
        spriteImage = await Flame.images.load('birds/blue_bird.png');
        break;
      case 3:
        spriteImage = await Flame.images.load('birds/sup_bird.png');
        break;
      case 4:
        spriteImage = await Flame.images.load('birds/vip01.png');
        break;
      case 5:
        spriteImage = await Flame.images.load('birds/vip02.png');
        break;
      default:
        spriteImage = await Flame.images.load('bird.png');
        break;
    }
    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    sprite = Sprite(spriteImage!);
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Hiệu ứng chuyển động
    // time += dt;
    // position.y = initialHeight + amplitude * sin(2 * pi * frequency * time);

    position.y += velocity * dt;

    _point();

    // gameRef.soundManager.playGetPointSound();
  }

  void _point() {
    if (gameRef.pipeGroup.passedPipe(this)) {
      gameRef.increaseScore();
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    _gameOver();
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -100),
        EffectController(duration: 0.5, curve: Curves.decelerate),
      ),
    );
  }

  void _gameOver() {
    gameRef.stopListening();
    gameRef.overlays.add('gameOver');
    gameRef.pauseEngine();
  }

  reset() {
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
  }
}
