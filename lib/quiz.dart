import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quize extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionindex;
  final Function answerQuestion;

  Quize({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionindex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionindex]['questionText'],
        ),
        ...(questions[questionindex]['answers'] as List<Map<String, Object>>).map((answer) {
          return Answer(()=> answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
