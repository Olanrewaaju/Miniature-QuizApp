import 'package:flutter/material.dart';
import 'package:prexams/game/question_screen.dart';
import 'game/game_notifier.dart';
import 'package:provider/provider.dart';
import 'notifier.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Widget congrats(int score) {
    if (score == 8) {
      return Column(
        children: [Text('🎉 PERFECT SCORE! 🎉'), Text('You Score is $score')],
      );
    } else {
      return Text('Your score is  $score ');
    }
  }

  @override
  Widget build(BuildContext context) {
    void resetButton() {
      context.read<GameNotifier>().reset();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return QuestionScreen(number: 1);
          },
        ),
      );
    }

    final score = context.watch<GameNotifier>().score;
    final username = context.watch<Notifier>().username;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Spacer(),
              Text('Hello $username'),

              // Text('Your score is  $score '),
              congrats(score),
              Spacer(),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: resetButton,
                  child: Text(
                    'Reset Quiz',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//it should have a section to show that the user with his name did a great job and also have a section or button for the user to restart the screen straight from the first  question section