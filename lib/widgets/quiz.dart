import 'package:flutter/material.dart';
import '../models/Question.dart';

class Quiz extends StatelessWidget {
  final List<Question> questions;
  final int questionIndex;
  final Function answerQuestion;
  //final Function answerQuestion;

  Quiz(
      { //@required this.answerQuestion,
      @required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    int rightIndex = questions[questionIndex].answerIndex;

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
      return Container(
        width: double.infinity,
        child: RaisedButton(
          color: Colors.lightBlue,
          textColor: Colors.white,
          child: Text(answerTxt),
          onPressed: () {
            int score = 0;
            if (questions[questionIndex].allAnswers[rightIndex] == answerTxt)
              score = 1;
            answerQuestion(score);
          },
        ),
      );
    }

    return Column(children: [
      SizedBox(height: 10),
      Text('${questions.length}/${questionIndex + 1} السؤال'),
      Divider(thickness: 3),
      _question(questions[questionIndex].question),
      Divider(thickness: 3),
      ...questions[questionIndex].allAnswers.map((answer) {
        return _answers(answer);
      }).toList()
    ]);
  }
}

// ...(questions[questionIndex].allAnswers as List<String>).map((answer) {
//   // this call back only called when the user press on the answer
//   return Answer(() => answerQuestion(answer['score']), answer['text']);
// }).toList()
