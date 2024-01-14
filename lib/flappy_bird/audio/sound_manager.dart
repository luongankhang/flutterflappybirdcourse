import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  late final AudioPlayer _fallPlayer;
  late final AudioPlayer _fapPlayer;
  late final AudioPlayer _getPointPlayer;
  late final AudioPlayer _letgoPlayer;

  SoundManager() {
    _fallPlayer = AudioPlayer();
    _fapPlayer = AudioPlayer();
    _getPointPlayer = AudioPlayer();
    _letgoPlayer = AudioPlayer();
  }

  Future<void> init() async {
    try {
      // Load your audio file
    } catch (e) {
      print('Error loading audio files: $e');
    }
  }

  Future<void> playFallSound() async {
    await _fallPlayer.play(UrlSource('assets/audio/fall.wav'));
  }

  Future<void> playFapSound() async {
    await _fapPlayer.play(UrlSource('assets/audio/fap.wav'));
  }

  Future<void> playGetPointSound() async {
    await _fapPlayer.play(UrlSource('assets/audio/getpoint.wav'));
  }

  Future<void> playLetGoSound() async {
    await _letgoPlayer.play(UrlSource('assets/audio/letgo.mp3'));
  }
}
