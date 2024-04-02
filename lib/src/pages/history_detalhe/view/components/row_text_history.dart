import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import '../../../../config/custom_colors.dart';

// ignore: must_be_immutable

@JsonSerializable()
class RowTextHistory extends StatelessWidget {
  String text1;
  String text2;
  RowTextHistory({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text(text1,style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: CustomColors.customBlueColor,
          ),),
     
      Text(text2, style: const TextStyle(
              color: Colors.black,
              fontSize:14,
               fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

}
