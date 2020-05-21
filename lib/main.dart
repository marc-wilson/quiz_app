import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Blue', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Snake', 'score': 10},
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 8}
      ]
    },
    {
      'questionText': 'What\'s your favorite strain?',
      'answers': [
        {'text': 'Blue Dream', 'score': 10},
        {'text': 'White Widow', 'score': 1},
        {'text': 'AK47', 'score': 8}
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
