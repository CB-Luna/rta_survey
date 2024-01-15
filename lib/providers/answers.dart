import 'package:flutter/material.dart';

class Answers extends ChangeNotifier {
  List<Map<String, String>> _answers = [];

  List<Map<String, String>> get answers => _answers;

  void addAnswer(Map<String, String> answer) {
    // check if answer exist
    if (_answers.any((element) => element["id"] == answer["id"])) {
      _answers.removeWhere((element) => element["id"] == answer["id"]);
    }
    // add answer
    _answers.add(answer);
    notifyListeners();
  }

  void removeAnswer(String answerID) {
    _answers.remove(_answers.firstWhere((answer) => answer["id"] == answerID));
    notifyListeners();
  }
}
