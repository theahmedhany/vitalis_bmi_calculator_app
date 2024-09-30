import 'package:flutter/material.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:vitalis_bmi_calculator_app/constants/colors.dart';

class SwipeButton extends StatelessWidget {
  final bool isFinished;
  final VoidCallback onWaitingProcess;
  final VoidCallback onFinish;

  const SwipeButton({
    Key? key,
    required this.isFinished,
    required this.onWaitingProcess,
    required this.onFinish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: SwipeableButtonView(
        isFinished: isFinished,
        onFinish: onFinish,
        onWaitingProcess: onWaitingProcess,
        activeColor: kPrimaryColor,
        buttonWidget: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: kPrimaryColor,
        ),
        buttonText: "Lets Go",
        buttontextstyle: const TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
