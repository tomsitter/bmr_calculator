import 'package:bmr_calculator/src/constants.dart';
import 'package:flutter/material.dart';

import 'src/screens/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  BMICalculator({Key? key}) : super(key: key);
  // final ThemeData theme = ThemeData(
  //   scaffoldBackgroundColor: Color(0xFF0A0E21),
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: appBackgroundColour,
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              surface: appBackgroundColour,
              secondary: Colors.red,
            ),
      ),
    );
  }
}
