import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
//void main(){
//runApp(MyApp());
//}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your Favourite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your Favourite Animal?',
      'answers': [
        {'text': 'Rabit', 'score': 3},
        {'text': 'Snack', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'Who\'s your Favourite Instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
      ],
    },
  ];

  var _questionindex = 0;
  var _totalScore =0;
void _resetQuize(){
setState(() {
  _questionindex=0;
  _totalScore = 0;
});
}

  void _answerQuestion(int score) {

    _totalScore = _totalScore + score;

    setState(() {
      _questionindex = _questionindex + 1;
    });

    print(_questionindex);

    if (_questionindex < _questions.length) {
      print('We have more question!');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionindex < _questions.length
            ? Quize(
                questionindex: _questionindex,
                answerQuestion: _answerQuestion,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuize),
      ),
    );
  }
}
