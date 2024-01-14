import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird_course/flappy_bird/audio/sound_manager.dart';
import 'package:flappy_bird_course/flappy_bird/clients/background.dart';
import 'package:flappy_bird_course/flappy_bird/clients/bird.dart';
import 'package:flappy_bird_course/flappy_bird/clients/ground.dart';
import 'package:flappy_bird_course/flappy_bird/clients/pipe_group.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class FlappyBird extends FlameGame with TapDetector, HasCollisionDetection {
  late final Bird _bird;
  late final PipeGroup _pipeGroup;
  late final SoundManager soundManager;

  double speed = 200;
  double _timeSinceLastPipeGroup = 0;
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  double _score = 0;
  static String playerName = '';

  FlappyBird();

  @override
  Future<void> onLoad() async {
    await _initSpeech();
    await createGameEntities();
    await soundManager.init();
    overlays.add('gameReady');
  }

  @override
  void onTap() {
    super.onTap();
    _bird.fly();
    soundManager.playFapSound();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timeSinceLastPipeGroup += dt;
    if (_timeSinceLastPipeGroup > 1.5) {
      add(PipeGroup());
      _timeSinceLastPipeGroup = 0;
    }
  }

  Future<void> _initSpeech() async {
    bool hasPermission = await _speechToText.initialize(
      onError: (e) => print('ERROR $e'),
    );

    if (!hasPermission) {
      // Handle case where permission is not granted.
      print('Permission not granted. You might want to inform the user.');
    }

    _speechEnabled =
        hasPermission; // Or use _speechToText.isAvailable to check overall availability

    _startListening();
  }

  Future<void> _startListening() async {
    if (_speechEnabled) {
      await _speechToText.listen(
        onResult: _onSpeechResult,
        listenFor: Duration(seconds: 5),
      );
    } else {
      print('Speech recognition is not enabled.');
    }
  }

  Future<void> stopListening() async {
    soundManager.playFallSound();
    await _speechToText.cancel();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    print('res $result');
    String newWords = result.recognizedWords.toLowerCase();
    print('LAST $_lastWords');
    newWords = newWords.replaceAll(_lastWords.toLowerCase(), '');
    print('NEW $newWords');
    _lastWords = result.recognizedWords;
    if (newWords.toLowerCase().contains('jump')) {
      _bird.fly();
    }
  }

  Future<void> createGameEntities() async {
    _bird = Bird();
    _pipeGroup = PipeGroup();
    soundManager = SoundManager();
    await addAll([
      BackGround(),
      Ground(),
      _bird,
      _pipeGroup,
    ]);
  }

  void startGame() {
    overlays.add('gameReady');
    pauseEngine();
  }

  void restartGame() {
    overlays.remove('gameOver');
    _bird.reset();
    // _pipeGroup.resetPosition();
    resumeEngine();
  }

  PipeGroup get pipeGroup => _pipeGroup;

  double get score => _score;

  void increaseScore() {
    _score++;
    if (_score % 100 == 0) {
      speed += 1;
      print("Score: $score" + ", Speed: $speed");
    }
  }
}
