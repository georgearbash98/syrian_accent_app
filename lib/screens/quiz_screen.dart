import 'package:flutter/material.dart';
import '../screens/result_screen.dart';
import '../widgets/quiz.dart';
import '../Data.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz-screen';
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = DAMASCUS;

    void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length)
      print('we \'ve more questions');
    else
      print('no more questions');
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];

    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
                key: ValueKey(_questionIndex)
              )
            : Center(
                child: ResultScreen(_totalScore, _resetQuiz),
              ),
        );
  }
}
