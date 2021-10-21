import 'package:bmr_calculator/src/screens/results_page.dart';
import 'package:bmr_calculator/src/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 180;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    active: selectedGender == Gender.male ? true : false,
                    child: const LabelledIcon(
                      label: 'MALE',
                      icon: FaIcon(FontAwesomeIcons.mars, size: 80.0),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    active: selectedGender == Gender.female ? true : false,
                    child: const LabelledIcon(
                      label: 'FEMALE',
                      icon: FaIcon(FontAwesomeIcons.venus, size: 80.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: labelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: numberTextStyle),
                      const Text('cm', style: labelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: activeColour.withAlpha(32),
                      thumbColor: activeColour,
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: labelColour,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 240.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT', style: labelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(weight.toString(), style: numberTextStyle),
                              const Text('lb', style: labelTextStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: const FaIcon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(width: 20.0),
                              RoundIconButton(
                                icon: const FaIcon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE', style: labelTextStyle),
                          Text(age.toString(), style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: const FaIcon(FontAwesomeIcons.minus),
                                onPressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                              ),
                              const SizedBox(width: 20.0),
                              RoundIconButton(
                                icon: const FaIcon(FontAwesomeIcons.plus),
                                onPressed: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              onTap: () {
                var calc = CalculatorBrain(
                    height: height,
                    weight: weight,
                    gender: selectedGender,
                    age: age);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: calc.bmr,
                      resultText: calc.getBMRResult(),
                      interpretation: calc.getBMRInterpretation(),
                    ),
                  ),
                );
              },
              text: 'CALCULATE'),
        ],
      ),
    );
  }
}
