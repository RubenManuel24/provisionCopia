import 'package:flutter/material.dart';

import '../../config/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  bool value;
  final Function()? onPressed;
  CustomButton({
    Key? key,
    required this.text,
    required this.color,
    this.value = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: color),
    child: value 
        ? const CircularProgressIndicator(color:  Color(0xFF0C6CC7), backgroundColor:  Color(0xFFF58634),)
      :  Text(text,
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
