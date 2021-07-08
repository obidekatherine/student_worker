// this widget holds all field properties for this form
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final void Function(String) onChanged;
  final bool readOnly;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final int? maxLines;

  MyTextField({
    Key? key,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.readOnly = false,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      onChanged: onChanged,
      readOnly: readOnly,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38, width: 2.0)),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 5.0)),
        hintText: hintText,
      ),
      keyboardType: TextInputType.text,
    );
  }
}
