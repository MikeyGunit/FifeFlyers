import 'package:blahblah/Dashboard.dart';
import 'package:blahblah/FiftyFifty.dart';
import 'package:blahblah/Shop.dart';
import 'package:blahblah/VideoPageFiles/home_screen.dart';
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

  void _onItemTap(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  var blah = Image.asset(
    'assets/images/5050_outlined.png',
    width: 20,
  );

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
            icon: Image.asset("assets/images/Logo.png"),
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
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Color(0xffa2a5a4),
      //     child:
      //     ImageIcon(
      //       AssetImage("assets/images/Logo.png"), size: 40.0
      //     ),
      //     onPressed: null),
    );
  }
}
