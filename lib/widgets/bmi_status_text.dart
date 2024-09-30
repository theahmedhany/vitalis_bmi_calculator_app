import 'package:flutter/material.dart';

class BmiStatusText extends StatelessWidget {
  final String bmiStatus;
  final Color bmiStatusColor;

  const BmiStatusText(
      {Key? key, required this.bmiStatus, required this.bmiStatusColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      bmiStatus,
      style: TextStyle(
        fontSize: 28,
        color: bmiStatusColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
