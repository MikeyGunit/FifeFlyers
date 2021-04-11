import 'package:blahblah/Nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

// Keep for the login screen.
import 'package:blahblah/MenuFrame.dart';

// Keep for the dashboard screen.
import 'Dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dynamic token = FlutterSession().get('token');

  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Official Fife Flyers App',
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      secondaryHeaderColor: Colors.yellow,
      unselectedWidgetColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,

    ),
         // This is the code that should be used for live.
        //home: token != '' ? MenuFrame() : Dashboard(),
        home: Nav(), // MenuFrame for the login screen, Dashboard for bypassing login.
  ),
  );
}