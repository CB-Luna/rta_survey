import 'package:encuesta_rta/ui/pages/survey.dart';
import 'package:encuesta_rta/ui/theme/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RTA Survey',
        debugShowCheckedModeBanner: false,
        theme: defaultTheme,
        home: const Scaffold(
          body: Survey(),
        ));
  }
}
