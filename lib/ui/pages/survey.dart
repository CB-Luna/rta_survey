import 'package:encuesta_rta/data/constants.dart';
import 'package:encuesta_rta/data/questions.dart';
import 'package:encuesta_rta/providers/answers.dart';
import 'package:encuesta_rta/ui/components/q_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  State<Survey> createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  late List<dynamic> answers;

  bool surveyCompleted = false;
  bool loading = false;
  bool error = false;

  List<ExpansionTileController> tileControllers = [];

  void requiredFields() {
    final provAnswers = context.read<Answers>().answers;

    List<String> requiredIDs = [
      "1",
      "2",
      "3",
      "5",
      "6",
      "9",
      if (provAnswers.firstWhere((element) => element["id"] == "3")["value"] ==
          "More than 3 months")
        "4"
    ];

    for (var id in requiredIDs) {
      if (!provAnswers.any((e) => e["id"] == id)) {
        setState(() {
          error = true;
        });
        return;
      }
    }

    if (!provAnswers.any((e) => e["id"] == "7" || e["id"] == "8")) {
      setState(() {
        error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    answers = questions.map((q) => 0).toList();

    tileControllers =
        questions.map((q) => ExpansionTileController()).toList(growable: false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 800,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: mobile(context) ? 20 : 40.0, vertical: 20),
          alignment: Alignment.center,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https://strapi.rtatel.com/uploads/UI_00_RTA_logo_b337351d42.png",
                  width: 300,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  child: Column(
                    children: [
                      Text("Rice/Wheat Ln Fiber to the Home Survey",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 26,
                              fontWeight: FontWeight.w600)),
                      const SizedBox(height: 10),
                      const Text(
                          "Are you interested in getting gigFAST INTERNET® FIBER to your home with symmetrical speeds up to 1 gig?  We are local and would love to hear your opinion, please see the short survey below.  By filling out the survey we will offer you a free installation worth \$99.  Thank you and we look forward to hearing you.")
                    ],
                  ),
                ),
                ...questions
                    .map((q) => QBox(
                          question: q,
                          tileControllers: tileControllers,
                          questionNumber: questions.indexOf(q) + 1,
                        ))
                    .toList(),
                const SizedBox(height: 20),
                if (surveyCompleted) ...[
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: const Text(
                        "Thank you for taking the time to fill out the survey. If you provided your contact information, someone will be reaching out to you soon!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                  ),
                ],
                if (error) ...[
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Text("Please fill all the required (*) fields",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
                MouseRegion(
                  cursor: !surveyCompleted
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          error = context.read<Answers>().answers.length < 3;
                        });
                        if (error) return;
                        requiredFields();
                        if (error) return;
                        if (surveyCompleted) return;
                        setState(() {
                          error = false;
                          loading = true;
                        });
                        final answers = context.read<Answers>().answers;
                        await supabase
                            .schema("rta_surveys")
                            .from("survey_answers")
                            .insert({"survey_id": 1});
                        dynamic lastSurvey = await supabase
                            .schema("rta_surveys")
                            .from("survey_answers")
                            .select("id")
                            .order("id", ascending: false)
                            .limit(1);
                        final survID = lastSurvey[0]["id"];
                        await supabase
                            .schema("rta_surveys")
                            .from("answers")
                            .insert([
                          for (var a in answers)
                            {
                              "question_id": a["id"],
                              "answer": a["value"],
                              "survey_answers_id": survID
                            }
                        ]);
                        setState(() {
                          loading = false;
                        });
                        surveyCompleted = true;
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 2),
                          decoration: BoxDecoration(
                            color: !surveyCompleted
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                              loading
                                  ? "Loading..."
                                  : surveyCompleted
                                      ? "Completed!"
                                      : "Submit",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              )))),
                )
              ]),
        ),
      ),
    );
  }
}
