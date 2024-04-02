import 'package:flutter/material.dart';

class RowTextEquipment extends StatelessWidget {
  final String text1;
  final String text2;
  final bool? isColor;

  const RowTextEquipment(
      {super.key, required this.text1, required this.text2, this.isColor});

  @override
  Widget build(BuildContext context) {
    Color textColor;

    if (isColor == true) {
      textColor = Colors.green;
    } else if (isColor == null) {
      textColor = Color.fromARGB(255, 6, 6, 6);
    } else {
      textColor = Colors.red;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(text2,
            style: TextStyle(
              color: textColor,
              fontSize: 13,
            )),
      ],
    );
  }
}
