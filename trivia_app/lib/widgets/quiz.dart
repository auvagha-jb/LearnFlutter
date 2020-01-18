import 'package:flutter/material.dart';
import 'package:loyalty_app/widgets/question.dart';
import 'package:loyalty_app/widgets/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  
  const Quiz({
    @required this.questions,
    @required this.questionIndex,
    @required this.answerQuestion,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<Map>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}