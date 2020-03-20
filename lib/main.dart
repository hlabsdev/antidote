import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/quiz_page.dart';
import './pages/splash.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Splash(),
//    home: new QuizPage(),
  ));
}