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
    HomeScreen(),
    FiftyFifty()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Tutorial'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(31, 66, 146, 1.0),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            title: Text(
              'Shop',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined, color: Colors.white),
            title: Text(
              'Video',
            ),
          ),
          //mg: when this entry is added the menu background colour switches from blue to white...
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined, color: Colors.blue),
            title: Text(
              'Video',
            ),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.video_library_outlined, color: Colors.white),
          //   // icon: ImageIcon(
          //   //   AssetImage("assets/images/5050_outlined.png"),
          //   //   // color: Color(0xFF3A5A98),
          //   // ),
          //   title: Text(
          //     'Video',
          //   ),
          //),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13.0,
        unselectedFontSize: 13.0,
      ),
    );
  }
}
