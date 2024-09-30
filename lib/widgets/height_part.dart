import 'package:flutter/material.dart';
import 'package:vitalis_bmi_calculator_app/constants/colors.dart';

class HeightPart extends StatefulWidget {
  const HeightPart({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<HeightPart> createState() => _HeightPartState();
}

class _HeightPartState extends State<HeightPart> {
  int _height = 150;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Height',
              style: TextStyle(
                fontSize: 18,
                color: kTextColor,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _height.toString(),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'CM',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 300,
              child: RotatedBox(
                quarterTurns: -1,
                child: Slider(
                  min: 0,
                  max: 250,
                  value: _height.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _height = value.toInt();
                      widget.onChange(_height);
                    });
                  },
                  thumbColor: kPrimaryColor,
                  activeColor: kPrimaryColor,
                  inactiveColor: kBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
