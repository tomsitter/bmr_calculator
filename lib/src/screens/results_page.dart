import 'package:bmr_calculator/src/widgets.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {Key? key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15.0, left: 15.0),
            child: Text('Your Result ', style: titleTextStyle),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText,
                    style: const TextStyle(
                      color: labelColour,
                      fontSize: 16.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(bmiResult, style: numberTextStyle),
                      const Text('kcal/day', style: labelTextStyle),
                    ],
                  ),
                  Text(interpretation,
                      textAlign: TextAlign.center,
                      style: labelTextStyle.copyWith())
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
