import 'package:dart_vlc/dart_vlc.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/variable/containt.dart';
import 'package:test_flutter/video/play_video_screen.dart';

void main() {
  DartVLC.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: PlayVideoScreen(),
    );
  }
}
