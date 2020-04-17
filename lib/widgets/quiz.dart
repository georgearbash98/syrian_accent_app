import 'dart:async';

import 'package:flutter/material.dart';
import '../models/Question.dart';

class Quiz extends StatefulWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {
      @required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion,
      Key key
      }): super(key: key);

  int get answersCount {
    return questions[questionIndex].allAnswers.length;
  }

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Color initColor = Colors.lightBlue;
  Color rightAnswerColor = Colors.green;
  Color wrongAnswerColor = Colors.red;
  int _rightIndex;
  int _answersCount;
  List<Color> btnColor = [];

  @override
  void initState() {
    super.initState();
    _rightIndex = widget.questions[widget.questionIndex].answerIndex;
    _answersCount = widget.answersCount;
    btnColor = new List<Color>(_answersCount);
    //to set the initial color of all widget to the initial color (ex: blue)
    for (int i = 0; i < _answersCount; i++) btnColor[i] = initColor;
  }

  Widget _question(String questionTxt) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionTxt,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _answers(String answerTxt) {
    // to get the index of the displayed answer {helps with coloring the widget}
    int index =
        widget.questions[widget.questionIndex].allAnswers.indexOf(answerTxt);
        
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: btnColor[index],
        textColor: Colors.white,
        child: Text(answerTxt),
        onPressed: () {
          int score = 0;
          String _rightAnswer =
              widget.questions[widget.questionIndex].allAnswers[_rightIndex];
          Color color = wrongAnswerColor;
          if (_rightAnswer == answerTxt) {
            score = 1;
            color = rightAnswerColor;
          }
          setState(() {
            btnColor[index] = color;
          });
          // we use this so the user can see if his answer is correct or false then the app move to the next question
          Timer(Duration(milliseconds: 400), ()=>widget.answerQuestion(score));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      Text('${widget.questions.length}/${widget.questionIndex + 1} السؤال'),
      Divider(thickness: 3),
      _question(widget.questions[widget.questionIndex].question),
      Divider(thickness: 3),
      ...widget.questions[widget.questionIndex].allAnswers.map((answer) {
        return _answers(answer);
      }).toList()
    ]);
  }
}