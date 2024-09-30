import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitalis_bmi_calculator_app/constants/colors.dart';

class AgeWeightPart extends StatefulWidget {
  const AgeWeightPart(
      {super.key,
      required this.onChange,
      required this.title,
      required this.initalValue,
      required this.min,
      required this.max});

  final Function(int) onChange;

  final String title;
  final int initalValue;
  final int min;
  final int max;

  @override
  State<AgeWeightPart> createState() => _AgeWeightPartState();
}

class _AgeWeightPartState extends State<AgeWeightPart> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    counter = widget.initalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18,
              color: kTextColor,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            counter.toString(),
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    if (counter < widget.max) {
                      counter++;
                    }
                  });
                  widget.onChange(counter);
                },
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    if (counter > widget.min) {
                      counter--;
                    }
                  });
                  widget.onChange(counter);
                },
                padding: EdgeInsets.zero,
                child: Container(
                  alignment: Alignment.center,
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
