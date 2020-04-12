import 'package:flutter/material.dart';
import 'package:syrian_accent/screens/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final Function resetHandler;

  ResultScreen(this.score, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (score <= 8)
      resultText = 'Awesome and innocent!';
    else
      resultText = 'Good quiz';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "You Got " + score.toString(),
            style: TextStyle(
              fontSize: 48,
            ),
            textAlign: TextAlign.center,
          ),
          RaisedButton(
            child: Text("Restart Quiz!"),
            onPressed: resetHandler,
          ),
          RaisedButton(
            child: Text("Go Home page"),
            onPressed: ()=> Navigator.of(context).popAndPushNamed(HomeScreen.routeName),
          ),
        ],
      ),
    );
  }
}