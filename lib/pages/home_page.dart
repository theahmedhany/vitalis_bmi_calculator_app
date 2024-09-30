import 'dart:math';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:vitalis_bmi_calculator_app/constants/colors.dart';
import 'package:vitalis_bmi_calculator_app/pages/score_page.dart';
import 'package:vitalis_bmi_calculator_app/widgets/age_weight_part.dart';
import 'package:vitalis_bmi_calculator_app/widgets/gender_part.dart';
import 'package:vitalis_bmi_calculator_app/widgets/height_part.dart';
import 'package:vitalis_bmi_calculator_app/widgets/header_section.dart';
import 'package:vitalis_bmi_calculator_app/widgets/swipe_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _gender = 0;
  int _height = 150;
  int _age = 20;
  int _weight = 50;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderSection(),
              const SizedBox(height: 40),
              GenderPart(
                onChange: (genderVal) {
                  setState(() {
                    _gender = genderVal;
                  });
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeightPart(
                    onChange: (heightVal) {
                      setState(() {
                        _height = heightVal;
                      });
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AgeWeightPart(
                        onChange: (weightVal) {
                          setState(() {
                            _weight = weightVal;
                          });
                        },
                        title: 'Weight',
                        initalValue: 50,
                        min: 20,
                        max: 200,
                      ),
                      const SizedBox(height: 20),
                      AgeWeightPart(
                        onChange: (ageVal) {
                          setState(() {
                            _age = ageVal;
                          });
                        },
                        title: 'Age',
                        initalValue: 20,
                        min: 1,
                        max: 100,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 18),
              SwipeButton(
                isFinished: _isFinished,
                onFinish: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      child: ScorePage(
                        bmiScore: _bmiScore,
                        age: _age,
                      ),
                      type: PageTransitionType.fade,
                    ),
                  );
                  setState(() {
                    _isFinished = false;
                  });
                },
                onWaitingProcess: () {
                  calculateBmi();
                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      _isFinished = true;
                    });
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateBmi() {
    _bmiScore = _weight / pow(_height / 100, 2);
  }
}
