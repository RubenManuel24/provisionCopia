import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/custom_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool isSecret;
  List<TextInputFormatter>? textInputFormatter;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final GlobalKey<FormFieldState>? formFieldKey;

  CustomTextField({
    Key? key,
    required this.label,
    this.icon = Icons.add,
    this.isSecret = false,
    this.textInputFormatter,
    this.initialValue,
    this.readOnly = false,
    this.validator,
    this.onSaved,
    this.controller,
    this.textInputType,
    this.formFieldKey,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: widget.formFieldKey,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        onSaved: widget.onSaved,
        inputFormatters: widget.textInputFormatter,
        obscureText: isObscure,
        validator: widget.validator,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret
              ? IconButton(
                  color: CustomColors.customOrangeColor,
                  icon:
                      Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  })
              : null,
          label: Text(widget.label),
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        ));
  }
}
