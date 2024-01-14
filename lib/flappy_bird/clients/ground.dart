import 'dart:ui' as ui;

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flutter/cupertino.dart';

class Ground extends ParallaxComponent<FlappyBird> {
  Ground();

  @override
  Future<void> onLoad() async {
    await _createObject();
  }

  Future<void> _createObject() async {
    final image = await Flame.images.load('base.png');
    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(image, fill: LayerFill.none),
      ),
    ]);
    add(
      RectangleHitbox(
          position: Vector2(0, game.size.y - 110),
          size: Vector2(game.size.x, 110)),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x = game.speed;
  }

  @override
  void render(Canvas c) {
    super.render(c);

    // Tạo một đối tượng Paint để thiết lập thuộc tính vẽ
    final Paint paint = Paint()
      ..color = Color(0xFFFFFFFF) // Màu trắng
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    // Tạo một đối tượng Paragraph để hiển thị điểm
    final ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
      ui.ParagraphStyle(
        textAlign: TextAlign.center,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        textDirection: TextDirection.ltr,
      ),
    )
      ..pushStyle(ui.TextStyle(color: Color(0xFF000000))) // Màu đen
      ..addText('Player: ${FlappyBird.playerName} - Score: ${game.score}');

    final ui.Paragraph paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: game.size.x));

    // Vẽ điểm ở vị trí cụ thể trên Canvas
    c.drawParagraph(
      paragraph,
      ui.Offset(
        game.size.x / 2 - paragraph.width / 2,
        game.size.y - 40, // Vị trí theo y, bạn có thể điều chỉnh tùy ý
      ),
    );
  }
}
