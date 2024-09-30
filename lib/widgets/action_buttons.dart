import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vitalis_bmi_calculator_app/constants/colors.dart';

class ActionButtons extends StatelessWidget {
  final double bmiScore;
  final int age;

  const ActionButtons({Key? key, required this.bmiScore, required this.age})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            width: 160,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.replay_rounded, size: 24, color: Colors.white),
                SizedBox(width: 8),
                Text('Retry',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Share.share(
                "Your BMI is ${bmiScore.toStringAsFixed(1)} at age $age");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            width: 160,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.share_rounded, size: 24, color: Colors.white),
                SizedBox(width: 8),
                Text('Share',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
