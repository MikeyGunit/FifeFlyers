import 'dart:math' show Random;

import 'package:audioplayers/audio_cache.dart';
import 'Dashboard.dart';
import 'FiftyFifty.dart';
import 'Shop.dart';
import 'VideoPageFiles/home_screen.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Shop(),
    null,
    HomeScreen(),
    FiftyFifty()
  ];

  final _audioCache = AudioCache();
  var _audioPlayer;
  final randomNumberGenerator = new Random();

  var audioFileNames = ["RatherStayInKirkcaldy", "kirkcaldy1"];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTap(int index) async {
    //Flyers logo
    if (index == 2) {
      //random number between 1 and 10
      var randomNumber = randomNumberGenerator.nextInt(10) + 1;

      //90% chance of RatherStayInKirkcaldy, 10% chance of kirkcaldy1
      var mp3Index = randomNumber <= 9 ? 0 : 1;

      //stop any previous sound from playing
      if (_audioPlayer != null)
        _audioPlayer.stop();

      _audioPlayer = await _audioCache.play("sounds/" + audioFileNames[mp3Index] + ".mp3");
    }
    //menu option
    else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text(
              'Shop',
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/images/Logo.png", height: MediaQuery.of(context).orientation == Orientation.portrait ? 50 : 35),
            title: Text(
              'Logo',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            title: Text(
              'Video',
            ),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/5050_outlined.png"),
            ),
            title: Text(
              '50/50',
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(250, 208, 26, 1.0),
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
