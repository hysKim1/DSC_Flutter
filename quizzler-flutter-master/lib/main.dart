import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int score = 0;
  void checkAns(bool userAns) {
    bool correctAnswer = quizBrain.getCorrectAns();

    setState(() {
      if (quizBrain.isFinished() == true) {
        int total = quizBrain.total();

        Alert(
            context: context,
            title: "$score/$total개  맞추셨습니다.",
            desc: "종료하시겠습니까?",
            buttons: [
              DialogButton(
                child: Text(
                  "종료하기 ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ]).show();
        // initialization
        quizBrain.reset();
        scoreKeeper = [];
        score = 0;
      } else {
        if (userAns == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));
          score++;
          print('$score Correct!');
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
          print('Wrong!');
        }
        quizBrain.nextQuestion();
      }
    });
  }
  /* replacd by by creating a new class
  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet',
    'A slug\'s blood is green.'
  ];
  List<bool> ans = [false, true, true];*/

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuetsionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAns(true);
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAns(false);
              },
            ),
          ),
        ),
        // socre keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
