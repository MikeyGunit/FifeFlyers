import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

// Keep for the login screen.
import 'package:blahblah/LoginBody.dart';

// Keep for the dashboard screen.
import 'dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dynamic token = FlutterSession().get('token');

  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Fife Flyers',
    theme: ThemeData(
      primarySwatch: Colors.yellow,
      secondaryHeaderColor: Colors.red[50],
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
         // This is the code that should be used for live.
        // home: token != '' ? MenuFrame() : Dashboard(),
        home: Dashboard(), // MenuFrame for the login screen, Dashboard for bypassing login.
  ),
  );
}