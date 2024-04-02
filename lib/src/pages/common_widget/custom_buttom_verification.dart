import 'package:flutter/material.dart';

class CustomButtomVerification extends StatelessWidget {
  final String text;
  final Color color;
  final Function() onTap;
  const CustomButtomVerification({
    Key? key,
    required this.text,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            padding: MaterialStateProperty.all<EdgeInsets>(
               EdgeInsets.all(4)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              )
            )
         ),
        onPressed: onTap,
        child: Text(text, style: const TextStyle( fontWeight: FontWeight.bold,fontSize: 10, color: Colors.black),));
  }
}
