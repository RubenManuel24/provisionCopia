import 'package:flutter/material.dart';

class TextFieldRegister extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final bool readOnly;
  final String? initialValue;
  
  const TextFieldRegister({
    Key? key,
    this.textEditingController,
    this.validator,
    this.readOnly = false,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      readOnly: readOnly,
      initialValue: initialValue,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
