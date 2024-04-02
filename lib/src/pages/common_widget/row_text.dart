import 'package:flutter/material.dart';
import '../../config/custom_colors.dart';

class RowText extends StatelessWidget {
  final String text1;
  final String text2;

  const RowText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: CustomColors.customBlueColor),
        ),
        Text(text2,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}
