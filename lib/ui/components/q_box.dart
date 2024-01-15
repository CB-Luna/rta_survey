import 'package:encuesta_rta/data/constants.dart';
import 'package:encuesta_rta/data/questions.dart';
import 'package:encuesta_rta/providers/answers.dart';
import 'package:encuesta_rta/ui/components/text_box.dart';
import 'package:encuesta_rta/ui/components/text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QBox extends StatefulWidget {
  QBox(
      {Key? key,
      required this.question,
      required this.questionNumber,
      required this.selectedOption})
      : super(key: key);

  final dynamic question;
  final int questionNumber;
  int selectedOption;

  @override
  State<QBox> createState() => _QBoxState();
}

class _QBoxState extends State<QBox> {
  @override
  Widget build(BuildContext context) {
    final answersProvider = context.read<Answers>();
    void selectOption(int option) {
      setState(() {
        widget.selectedOption = option;
      });
      answersProvider.addAnswer({
        "id": widget.question["id"],
        "value": widget.question["options"][option - 1],
      });
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff2097f3)),
                child: Text(widget.questionNumber.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: Text(widget.question["question"],
                    style: const TextStyle(
                        fontSize: 17.0, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                ),
                margin: const EdgeInsets.all(35 / 2),
                width: 1,
                height: widget.question["options"].length == 0 ? 0 : 130,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.question["options"].length == 0)
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextForm(),
                    ),
                  for (dynamic ans in widget.question["options"]) ...[
                    Row(
                      children: [
                        Radio(
                          fillColor: MaterialStateProperty.all<Color>(
                              Theme.of(context).colorScheme.primary),
                          value: widget.question["options"].indexOf(ans) + 1,
                          groupValue: widget.selectedOption,
                          onChanged: (value) {
                            selectOption(value as int);
                          },
                        ),
                        TapRegion(
                          onTapInside: (event) {
                            selectOption(
                                widget.question["options"].indexOf(ans) + 1);
                          },
                          child: Text(ans,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: mobile(context) ? 15.0 : 17.0,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColor)),
                        ),
                      ],
                    ),
                    if (widget.selectedOption == 4 &&
                        widget.question["options"].indexOf(ans) == 3 &&
                        widget.questionNumber == 3)
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: TextBox(
                            label: widget.question["followUp"],
                            hint: widget.question["followUp"],
                            icon: Icons.question_mark,
                            qID: "4",
                          ))
                  ]
                ],
              )
            ],
          )
        ]);
  }
}
