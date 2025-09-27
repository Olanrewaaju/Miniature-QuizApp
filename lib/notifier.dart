import 'package:flutter/material.dart';

class Notifier extends ChangeNotifier {
  String _username = '';

  String get username => _username;

  void person(String newValue) {
    _username = newValue;
    notifyListeners();
  }
}
