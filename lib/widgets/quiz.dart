import 'dart:async';

import 'package:flutter/material.dart';
import '../models/Question.dart';

class Quiz extends StatefulWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function answerQuestion;
  //final Function answerQuestion;

  Quiz(
      { //@required this.answerQuestion,
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
          Timer(Duration(milliseconds: 600), ()=>widget.answerQuestion(score));
          
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

// ...(questions[questionIndex].allAnswers as List<String>).map((answer) {
//   // this call back only called when the user press on the answer
//   return Answer(() => answerQuestion(answer['score']), answer['text']);
// }).toList()
