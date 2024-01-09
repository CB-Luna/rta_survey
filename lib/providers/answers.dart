import 'package:flutter/material.dart';

class Answers extends ChangeNotifier {
  List<String> _answers = [];

  List<String> get answers => _answers;

  set answers(List<String> answers) {
    _answers = answers;
    notifyListeners();
  }

  void addAnswer(String answer) {
    _answers.add(answer);
    notifyListeners();
  }

  void removeAnswer(String answer) {
    _answers.remove(answer);
    notifyListeners();
  }
}
