import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flappy_bird_course/flappy_bird/models/map_info.dart';

class BackGround extends SpriteComponent with HasGameRef<FlappyBird> {
  Image? spriteImage;

  BackGround();

  @override
  Future<void> onLoad() async {
    if (MapInfo.selectedValue == 0) {
      spriteImage = await Flame.images.load('background.png');
    }
    switch (MapInfo.selectedValue) {
      case 1:
        spriteImage = await Flame.images.load('maps/dark_map.png');
        break;
      default:
        spriteImage = await Flame.images.load('background.png');
        break;
    }
    size = gameRef.size;
    sprite = Sprite(spriteImage!);
  }

// @override
// void render(Canvas c) {
//   super.render(c);
//
//   // Tạo một đối tượng Paint để thiết lập thuộc tính vẽ
//   final Paint paint = Paint()
//     ..color = Color(0xFFFFFFFF) // Màu trắng
//     ..style = PaintingStyle.fill
//     ..strokeWidth = 5;
//
//   // Tạo một đối tượng Paragraph để hiển thị điểm
//   final ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(
//     ui.ParagraphStyle(
//       textAlign: TextAlign.center,
//       fontWeight: FontWeight.bold,
//       fontSize: 20.0,
//       textDirection: TextDirection.ltr,
//     ),
//   )
//     ..pushStyle(ui.TextStyle(color: Color(0xFF000000))) // Màu đen
//     ..addText('Player: ${FlappyBird.playerName} - Score: ${game.score}');
//
//   final ui.Paragraph paragraph = paragraphBuilder.build()
//     ..layout(ui.ParagraphConstraints(width: game.size.x));
//
//   // Vẽ điểm ở vị trí cụ thể trên Canvas
//   c.drawParagraph(
//     paragraph,
//     ui.Offset(
//       game.size.x / 2 - paragraph.width / 2,
//       20, // Vị trí theo y, bạn có thể điều chỉnh tùy ý
//     ),
//   );
// }
}
