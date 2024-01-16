import 'package:encuesta_rta/data/constants.dart';
import 'package:encuesta_rta/data/questions.dart';
import 'package:encuesta_rta/providers/answers.dart';
import 'package:encuesta_rta/ui/components/text_box.dart';
import 'package:encuesta_rta/ui/components/text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class QBox extends StatefulWidget {
  QBox({
    Key? key,
    required this.question,
    required this.questionNumber,
    required this.tileControllers,
  }) : super(key: key);

  final dynamic question;
  final int questionNumber;
  final List<ExpansionTileController> tileControllers;

  @override
  State<QBox> createState() => _QBoxState();
}

class _QBoxState extends State<QBox> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    final answersProvider = context.read<Answers>();
    void selectOption(int option) {
      setState(() {
        selectedOption = option;
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
          ExpansionTile(
            initiallyExpanded: widget.questionNumber == 1 ? true : false,
            controller: widget.tileControllers[widget.questionNumber - 1],
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary),
                  child: Text(widget.questionNumber.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Text(widget.question["question"],
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600)),
                ),
                Text(
                  "*",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[500],
                      ),
                      margin: const EdgeInsets.all(35 / 2),
                      width: 1,
                      height: widget.question["options"].length == 0 ? 0 : 130,
                    ),
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
                              value:
                                  widget.question["options"].indexOf(ans) + 1,
                              groupValue: selectedOption,
                              onChanged: (value) {
                                selectOption(value as int);
                              },
                            ),
                            TapRegion(
                              onTapInside: (event) {
                                selectOption(
                                    widget.question["options"].indexOf(ans) +
                                        1);
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
                        if (selectedOption == 4 &&
                            widget.question["options"].indexOf(ans) == 3 &&
                            widget.questionNumber == 3)
                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: TextBox(
                                label: widget.question["followUp"],
                                hint: widget.question["followUp"],
                                icon: Icons.question_mark,
                                qID: "4",
                              )),
                      ],
                      Row(
                        children: [
                          if (widget.questionNumber != 1)
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    widget.tileControllers[
                                            widget.questionNumber - 1]
                                        .collapse();
                                    widget.tileControllers[
                                            widget.questionNumber - 2]
                                        .expand();
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 10.0, bottom: 10.0, right: 10.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: const Text("Back",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          )))),
                            ),
                          if (widget.questionNumber != questions.length)
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                  onTap: () {
                                    widget.tileControllers[
                                            widget.questionNumber - 1]
                                        .collapse();
                                    widget
                                        .tileControllers[widget.questionNumber]
                                        .expand();
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: const Text("Next",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                          )))),
                            )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ]);
  }
}
