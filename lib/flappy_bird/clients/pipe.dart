import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flappy_bird_course/flappy_bird/services/pipe_position.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappyBird> {
  final PipePosition _pipePosition;
  final double _height;

  Pipe({required PipePosition pipePosition, required double height})
      : _pipePosition = pipePosition,
        _height = height;

  @override
  Future<void> onLoad() async {
    await _createObject();
  }

  Future<void> _createObject() async {
    final pipe = await Flame.images.load('pipe.png');
    final pipeRotated = await Flame.images.load('pipe_rotated.png');
    size = Vector2(50, _height);
    switch (_pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - 110;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}
