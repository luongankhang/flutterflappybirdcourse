import 'package:flutter/services.dart';

class FontApp {
  FontApp();

  Future<void> loadFont() async {
    List<ByteData> fontData = await Future.wait([
      rootBundle.load('assets/fonts/JetBrainsMonoNLNerdFont-Regular.ttf'),
    ]);

    final regularFont = FontLoader('JetBrainsMonoNLNerdFont-Regular')
      ..addFont(Future.value(fontData[0]));

    await regularFont.load();
  }
}
