import 'package:encuesta_rta/data/questions.dart';
import 'package:encuesta_rta/ui/components/q_box.dart';
import 'package:flutter/material.dart';

class Survey extends StatelessWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: questions
              .map((q) => QBox(
                  question: q,
                  questionNumber: questions.indexOf(q) + 1,
                  selectedOption: 0))
              .toList()),
    );
  }
}
