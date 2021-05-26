import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'What\'s Your favourite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 3},
          {'text': 'Snake', 'score': 11},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 9}
        ],
      },
      {
        'questionText': 'What\s your favourite food?',
        'answers': [
          {'text': 'Egusi', 'score': 1},
          {'text': 'Rice', 'score': 1},
          {'text': 'indomie', 'score': 1},
          {'text': 'Spaghetti', 'score': 1}
        ],
      },
      {
        'questionText': 'What\s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1}
        ],
      },
    ];

    var _questionIndex = 0;
    var _totalScore = 0;


    void _resetQuiz(){
      setState(() {
            _questionIndex = 0;
      _totalScore = 0;
      });
    }




    void _answerQuestion(int score) {
      _totalScore+=score;
      setState(() {
        _questionIndex++;
      });
      // print(_questionIndex);
    }

    // questions = [];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('This is My FirstApp'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
