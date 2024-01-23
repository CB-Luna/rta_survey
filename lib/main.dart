import 'package:encuesta_rta/data/constants.dart';
import 'package:encuesta_rta/providers/answers.dart';
import 'package:encuesta_rta/ui/pages/survey.dart';
import 'package:encuesta_rta/ui/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: anonKey,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => Answers(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ScrollController controller = ScrollController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RTA Survey',
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: Consumer<Answers>(
          builder: (context, value, child) => Scaffold(
            body: Scrollbar(
              thumbVisibility: true,
              thickness: 10,
              controller: controller,
              child: SingleChildScrollView(
                  controller: controller, child: const Survey()),
            ),
          ),
        ));
  }
}
