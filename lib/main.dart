import 'package:body_mass_calculator/results.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:body_mass_calculator/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.grey[900],
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme : TextTheme(bodyText1:
        TextStyle(color: Colors.white))

      ),
        home: InputPage(),
    );}
}