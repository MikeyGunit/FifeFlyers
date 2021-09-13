import 'Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

// Keep for the login screen.
import 'MenuFrame.dart';

// Keep for the dashboard screen.
//import 'Dashboard.dart';

// For building the new Starting menu.
import 'StartingMenu.dart';

void main() {

  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'The Fife Flyers',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      secondaryHeaderColor: Colors.yellow,
      unselectedWidgetColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,

    ),
         // This is the code that should be used for live.
        //home: token != '' ? MenuFrame() : Dashboard(),
        home: Nav(), // MenuFrame for the login screen, Nav for bypassing login.
  ),
  );
}