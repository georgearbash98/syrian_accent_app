import 'package:flutter/cupertino.dart';

class Question {
  final String question;
  final List<String> allAnswers;
  final answerIndex;

  const Question({
    @required this.question,
    @required this.allAnswers,
    @required this.answerIndex,
  });
}
