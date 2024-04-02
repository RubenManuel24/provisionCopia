import 'package:flutter/material.dart';
import '../../../../config/custom_colors.dart';

class ShowDialogProgress extends StatelessWidget {
  bool progressFinish;
  ShowDialogProgress({
    Key? key,
    this.progressFinish = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: CircularProgressIndicator(
            color: CustomColors.customBlueColor,
            backgroundColor: CustomColors.customOrangeColor,
            strokeWidth: 8),
      ),
      content: Text(
        "Enviando os Dados",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
