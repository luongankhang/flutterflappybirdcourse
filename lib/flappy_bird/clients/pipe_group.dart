import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird_course/flappy_bird/clients/bird.dart';
import 'package:flappy_bird_course/flappy_bird/clients/pipe.dart';
import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flappy_bird_course/flappy_bird/services/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBird> {
  final Random _random = Random();

  PipeGroup();

  @override
  Future<void> onLoad() async {
    _createObject();
  }

  void _createObject() {
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - 110;
    final spacing = 60 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);
    addAll([
      Pipe(pipePosition: PipePosition.top, height: centerY - spacing),
      Pipe(
          pipePosition: PipePosition.bottom,
          height: heightMinusGround - (centerY + spacing)),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= gameRef.speed * dt;
    if (position.x < -50) {
      removeFromParent();
    }
  }

  bool passedPipe(Bird bird) {
    final pipePositionX = position.x + 50;
    return pipePositionX < bird.position.x;
  }

  void resetPosition() {
    position.x = gameRef.size.x;
  }
}
