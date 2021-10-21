import 'dart:math';
import 'constants.dart';

class CalculatorBrain {
  final int height;
  final int weight;
  final double _weightKg;
  final int age;
  final Gender gender;
  static final double _kgConversion = 0.453592;

  CalculatorBrain(
      {required this.height,
      required this.weight,
      required this.gender,
      required this.age})
      : _weightKg = weight * _kgConversion;

  String get bmr {
    // Formula: https://www.garnethealth.org/news/basal-metabolic-rate-calculator
    if (gender == Gender.male) {
      return (88.362 + (13.397 * _weightKg) + (4.799 * height) - (5.677 * age))
          .toStringAsFixed(1);
    } else if (gender == Gender.female) {
      return (447.593 + (9.247 * _weightKg) + (3.098 * height) - (4.330 * age))
          .toStringAsFixed(1);
    } else {
      return 'Could not calculate';
    }
  }

  String get bmi {
    return (_weightKg / pow(height / 100, 2)).toStringAsFixed(1);
  }

  String getBMIResult() {
    double _bmi = double.parse(bmi);
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getBMIInterpretation() {
    double _bmi = double.parse(bmi);
    if (_bmi >= 25) {
      return 'Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'Good job!';
    } else {
      return 'You can eat a bit more';
    }
  }

  String getBMRResult() {
    return 'ESTIMATED BMR';
  }

  String getBMRInterpretation() {
    return 'Your Basal Metabolic Rate (BMR) is the number of calories you burn as your body performs basic (basal) life-sustaining function';
  }
}
