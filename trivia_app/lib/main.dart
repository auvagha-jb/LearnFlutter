import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import './widgets/result.dart';
import './widgets/quiz.dart';

void main() => runApp(MyApp());

//This is a stateful widget. When the state changes the widget is rebuilt
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//This is the state of the widget
class _MyAppState extends State<MyApp> {
  var _totalScore = 0;

  static const _questions = [
    {
      "questionText": "What's your favorite colour",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 6},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "questionText": "Who's your favorite instructor?",
      "answers": [
        {"text": "Jay", "score": 10},
        {"text": "Blossom", "score": 6},
        {"text": "Bee", "score": 3},
        {"text": "Juke", "score": 1},
      ]
    },
    {
      "questionText": "What's your favorite animal",
      "answers": [
        {"text": "Snake", "score": 10},
        {"text": "Eagle", "score": 6},
        {"text": "Cat", "score": 3},
        {"text": "Dog", "score": 1},
      ]
    }
  ];
  var _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Personality Trivia")),
        body: _questionIndex < _questions.length
            ?
            //What to display when there are questions left
            new Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            //When there are no questions left
            : new Result(_totalScore, _resetQuiz),
      ),
    );
  }

  ///Calculates the total score and moves to the next question
  void _answerQuestion(int score) {
    _totalScore += score;//add score to total score

    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex++;
      }
    });
  }

   void _resetQuiz() {
     setState(() {
       _questionIndex = 0;
       _totalScore = 0;
     });
   }

}
