import 'package:flutter/material.dart';

class MyTextfields extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const MyTextfields(
      {super.key,
      this.suffixIcon,
      required this.controller,
      this.obscureText,
      required this.validator,
      required this.keyboardType,
      required this.hintText,
      this.hintStyle,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
          prefixIcon: prefixIcon),
    );
  }
}
