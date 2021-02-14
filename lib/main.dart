import 'package:flutter/material.dart';
import 'package:gpsjournal/screens/sign_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPSJournal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignScreen(),
    );
  }
}