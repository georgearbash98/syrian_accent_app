import 'package:flutter/material.dart';
import 'package:syrian_accent/screens/credits_screen.dart';
import './screens/quiz_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syrian Accent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/' : (ctx) => HomeScreen(),
        QuizScreen.routeName: (ctx) => QuizScreen(),
        CreditsScreen.routeName: (ctx) => CreditsScreen() 
      },
    );
  }
}
