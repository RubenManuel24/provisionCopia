import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldDialog extends StatelessWidget {
 final TextEditingController textEditingController;
 List<TextInputFormatter>? inputFormatters;
 TextInputType textInputType;
 int maxLines;
 bool autoFocus;
 String label;
 String hintText;

  CustomTextFieldDialog({
    Key? key,
    required this.textEditingController,
    this.inputFormatters,
    this.textInputType = TextInputType.text,
    this.maxLines = 1 ,
    this.autoFocus = true,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                    controller: textEditingController,
                    inputFormatters:inputFormatters,
                    keyboardType:textInputType,
                    maxLines: maxLines,
                    autofocus: autoFocus ,
                    decoration: InputDecoration(
                        label: Text(label),
                        hintText: hintText),
                  );
  }
}
