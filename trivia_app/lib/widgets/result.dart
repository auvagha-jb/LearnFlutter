import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function resetQuiz;

  Result(this._totalScore, this.resetQuiz);

  String get resultPhrase {
    String resultText;
    if (_totalScore <= 8) {
      resultText = "You are awesome and innocent";
    } else if (_totalScore <= 12) {
      resultText = "You are likeable";
    } else if (_totalScore <= 16) {
      resultText = "You are ... strange?";
    } else {
      resultText = "You are baaad guy, duh!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(child: Text("Restart Quiz"), onPressed: resetQuiz, textColor: Colors.blue),
        ],
      ),
    );
  }
}
