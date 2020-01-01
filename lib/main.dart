import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
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
  var _questionindex = 0;
  void _answerQuestion() {
    setState(() {
      _questionindex = _questionindex + 1;
    });

    print(_questionindex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what\'s your Favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'what\'s your Favourite Animal?',
        'answers': ['Rabit', 'Snack', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'Who\'s your Favourite Instructor?',
        'answers': ['Max', 'Max', 'Max', 'Max'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionindex]['questionText'],
            ),
            ...(questions[_questionindex]['answers'] as List<String>).map((answer){
            return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
