import 'package:flutter/material.dart';

class BmiInterpretationText extends StatelessWidget {
  final String bmiInterpretation;

  const BmiInterpretationText({Key? key, required this.bmiInterpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      bmiInterpretation,
      style: const TextStyle(
        fontSize: 18,
        color: Color(0xff313851),
      ),
    );
  }
}
