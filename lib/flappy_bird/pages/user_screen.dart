import 'package:flappy_bird_course/flappy_bird/flappy_bird.dart';
import 'package:flappy_bird_course/flappy_bird/pages/birds_screen.dart';
import 'package:flappy_bird_course/flappy_bird/pages/game_screen.dart';
import 'package:flappy_bird_course/flappy_bird/services/font_app.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<UserScreen> {
  late FontApp font;
  TextEditingController _nameController = TextEditingController();

  _ScreenState();

  @override
  void initState() {
    super.initState();
    font = FontApp();
    font.loadFont();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Flappy Bird',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'JetBrainsMonoNLNerdFont-Regular',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nhập tên người chơi',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BirdsScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.blue,
                          elevation: 5,
                          shadowColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: Text('Trở về'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            FlappyBird.playerName = _nameController.text;
                            if (FlappyBird.playerName == '') {
                              FlappyBird.playerName = 'Player test';
                            }
                          });
                          print(
                              'Bắt đầu chơi với tên người chơi: ${FlappyBird.playerName}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GameScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.blue,
                          elevation: 5,
                          shadowColor: Colors.black,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                        child: Text('Vào game'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
