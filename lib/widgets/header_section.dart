import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Welcome 😊",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        SizedBox(height: 1),
        Row(
          children: [
            Text(
              "Vitalis BMI Calculator",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
