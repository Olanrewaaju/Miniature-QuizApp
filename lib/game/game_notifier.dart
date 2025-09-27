import 'package:flutter/material.dart';
import 'package:prexams/game/dummy_file.dart';
import 'package:prexams/game/question.dart';
import 'question_screen.dart';
import 'package:prexams/result.dart';

class GameNotifier extends ChangeNotifier {
  int _answer = 0;
  int _score = 0;

  int get answer => _answer;
  int get score => _score;
  Question get currentQuestion => sampleQuestions[_answer];

  void answerQuestion(BuildContext context, int selected) {
    if (selected == currentQuestion.answerIndex) {
      _score++;
    }
    if (_answer < sampleQuestions.length) {
      _answer++;
      notifyListeners();

      if (_answer >= sampleQuestions.length || _answer >= 8) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Result()),
        );
      } else {
        notifyListeners();
      }
    }
  }

  void reset() {
    _answer = 0;
    _score = 0;
    notifyListeners();
  }
}
