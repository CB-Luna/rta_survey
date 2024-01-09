import 'package:encuesta_rta/data/constants.dart';
import 'package:encuesta_rta/data/questions.dart';
import 'package:encuesta_rta/ui/components/q_box.dart';
import 'package:flutter/material.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  late List<dynamic> answers;
  @override
  void initState() {
    super.initState();
    answers = questions.map((q) => 0).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: mobile(context) ? 20 : 40.0, vertical: 20),
      alignment: Alignment.center,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...questions
                .map((q) => QBox(
                      question: q,
                      questionNumber: questions.indexOf(q) + 1,
                      selectedOption: answers[questions.indexOf(q)],
                    ))
                .toList(),
            TapRegion(
                onTapInside: (event) {
                  print(answers);
                },
                child: Text("Submit"))
          ]),
    );
  }
}
