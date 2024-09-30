import 'package:flutter/material.dart';
import 'package:vitalis_bmi_calculator_app/constants/colors.dart';
import 'package:vitalis_bmi_calculator_app/widgets/bmi_gauge.dart';
import 'package:vitalis_bmi_calculator_app/widgets/bmi_status_text.dart';
import 'package:vitalis_bmi_calculator_app/widgets/bmi_interpretation_text.dart';
import 'package:vitalis_bmi_calculator_app/widgets/action_buttons.dart';

// ignore: must_be_immutable
class ScorePage extends StatelessWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  ScorePage({super.key, required this.bmiScore, required this.age});

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Score",
                style: TextStyle(
                  fontSize: 32,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              BmiGauge(bmiScore: bmiScore),
              const SizedBox(height: 10),
              BmiStatusText(
                  bmiStatus: bmiStatus!, bmiStatusColor: bmiStatusColor!),
              const SizedBox(height: 12),
              BmiInterpretationText(bmiInterpretation: bmiInterpretation!),
              const SizedBox(height: 40),
              ActionButtons(bmiScore: bmiScore, age: age),
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity.";
      bmiStatusColor = const Color(0xfff9415b);
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise and reduce your weight.";
      bmiStatusColor = const Color(0xfff9d438);
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit.";
      bmiStatusColor = const Color(0xff5dcec4);
    } else {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight.";
      bmiStatusColor = const Color(0xff4aafa3);
    }
  }
}
