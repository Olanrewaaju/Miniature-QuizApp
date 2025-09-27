import 'dart:async';
import 'package:flutter/material.dart';

class QuizTimerNotifier extends ChangeNotifier {
  final int totalSeconds;
  int _timeLeft;
  Timer? _timer;

  int get timeLeft => _timeLeft;

  QuizTimerNotifier({this.totalSeconds = 20}) : _timeLeft = totalSeconds;

  void startTimer() {
    _timeLeft = totalSeconds;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;

        notifyListeners();
      } else {
        timer.cancel();
        print('Timer finished');
        notifyListeners();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
