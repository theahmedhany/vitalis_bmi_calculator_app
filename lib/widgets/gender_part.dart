import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitalis_bmi_calculator_app/constants/colors.dart';

class GenderPart extends StatefulWidget {
  final Function(int) onChange;
  const GenderPart({super.key, required this.onChange});

  @override
  State<GenderPart> createState() => _GenderState();
}

class _GenderState extends State<GenderPart> {
  int _gender = 1;

  final BoxDecoration selectedDecoration = BoxDecoration(
    color: kPrimaryColor,
    borderRadius: BorderRadius.circular(18),
  );

  final BoxDecoration unselectedDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _gender = 1;
            });
            widget.onChange(_gender);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            width: 180,
            decoration:
                _gender == 1 ? selectedDecoration : unselectedDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.male_rounded,
                  size: 32,
                  color: _gender == 1 ? Colors.white : kPrimaryColor,
                ),
                const SizedBox(width: 12),
                Text(
                  'Male',
                  style: TextStyle(
                    fontSize: 22,
                    color: _gender == 1 ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _gender = 2;
            });
            widget.onChange(_gender);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
            width: 180,
            decoration:
                _gender == 2 ? selectedDecoration : unselectedDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.female_rounded,
                  size: 32,
                  color: _gender == 2 ? Colors.white : kPrimaryColor,
                ),
                const SizedBox(width: 12),
                Text(
                  'Female',
                  style: TextStyle(
                    fontSize: 22,
                    color: _gender == 2 ? Colors.white : kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
