import 'package:flappy_bird_course/flappy_bird/models/bird_info.dart';
import 'package:flappy_bird_course/flappy_bird/pages/maps_screen.dart';
import 'package:flappy_bird_course/flappy_bird/pages/user_screen.dart';
import 'package:flutter/material.dart';

class BirdsScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<BirdsScreen> {
  final List<BirdInfo> birdList = [
    BirdInfo('Mặc định', 'assets/images/bird.png'),
    BirdInfo('Chim lửa', 'assets/images/birds/red_bird.png'),
    BirdInfo('Chim nước', 'assets/images/birds/blue_bird.png'),
    BirdInfo('Chim siêu nhân', 'assets/images/birds/sup_bird.png'),
    BirdInfo('Chim mập (VIP 1)', 'assets/images/birds/vip01.png'),
    BirdInfo('Chim mỏ nhọn (VIP 2)', 'assets/images/birds/vip02.png'),
  ];

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
        child: ListView.builder(
          itemCount: birdList.length,
          itemBuilder: (context, index) {
            return buildBirdTile(birdList[index], index);
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => MapsScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text('Trở về'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: Colors.blue,
              elevation: 5,
              shadowColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text('Tiếp theo'),
          ),
        ],
      ),
    );
  }

  Widget buildBirdTile(BirdInfo birdInfo, int index) {
    return RadioListTile(
      value: index,
      groupValue: BirdInfo.selectedValue,
      onChanged: (value) {
        setState(() {
          BirdInfo.selectedValue = value!;
        });
        print(BirdInfo.selectedValue);
      },
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              birdInfo.imagePath,
              width: 40,
              height: 40,
            ),
            SizedBox(height: 5),
            Text(
              birdInfo.label,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
