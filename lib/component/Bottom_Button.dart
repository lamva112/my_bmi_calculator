import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/constants/app_styles.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;

  const BottomButton({super.key, required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: kBottomContainerColour,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(bottom: 10),
          height: kBottomContainerHeight,
          child: Center(
            child: Text(
              buttonTitle,
              style: kLargeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
