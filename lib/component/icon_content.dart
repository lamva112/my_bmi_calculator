import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/constants/app_styles.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const IconContent({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 88,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
