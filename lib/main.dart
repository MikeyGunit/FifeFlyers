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
    title: 'Fife Flyers',
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
      secondaryHeaderColor: Colors.yellow,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
         // This is the code that should be used for live.
        //home: token != '' ? MenuFrame() : Dashboard(),
        home: Dashboard(), // MenuFrame for the login screen, Dashboard for bypassing login.
  ),
  );
}