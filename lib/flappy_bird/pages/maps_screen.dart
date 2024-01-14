import 'package:flappy_bird_course/flappy_bird/models/map_info.dart';
import 'package:flappy_bird_course/flappy_bird/pages/birds_screen.dart';
import 'package:flappy_bird_course/flappy_bird/pages/start_screen.dart';
import 'package:flutter/material.dart';

class MapsScreen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<MapsScreen> {
  final List<MapInfo> birdList = [
    MapInfo('Mặc định', 'assets/images/background.png'),
    MapInfo('Màn đêm', 'assets/images/maps/dark_map.png'),
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
                MaterialPageRoute(builder: (context) => StartScreen()),
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
                MaterialPageRoute(builder: (context) => BirdsScreen()),
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

  Widget buildBirdTile(MapInfo birdInfo, int index) {
    return RadioListTile(
      value: index,
      groupValue: MapInfo.selectedValue,
      onChanged: (value) {
        setState(() {
          MapInfo.selectedValue = value!;
        });
        print(MapInfo.selectedValue);
      },
      title: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 102,
            height: 150,
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  birdInfo.imagePath,
                  width: 100,
                  height: 200,
                ),
                SizedBox(height: 5),
                Text(
                  birdInfo.label,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
