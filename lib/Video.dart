import 'package:flutter/material.dart';
import 'VideoPageFiles/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flyers TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(31, 66, 146, 1.0),
      ),
      home: HomeScreen(),
    );
  }
}