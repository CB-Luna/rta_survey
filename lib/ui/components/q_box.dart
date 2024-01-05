import 'package:flutter/material.dart';

class QBox extends StatefulWidget {
  const QBox(
      {Key? key,
      required this.question,
      required this.questionNumber,
      required this.selectedOption})
      : super(key: key);

  final dynamic question;
  final int questionNumber;
  final int selectedOption;

  @override
  State<QBox> createState() => _QBoxState();
}

class _QBoxState extends State<QBox> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          Text(widget.question["question"],
              style:
                  const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w800))
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
            height: 100,
          )
        ],
      )
    ]);
  }
}
