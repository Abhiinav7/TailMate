import 'package:flutter/material.dart';

class MyTextfields extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final dynamic validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
final double horizontalPadding;
double verticalPadding;
   MyTextfields(
      {super.key,
        this.horizontalPadding=5,
        this.verticalPadding=5,
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
        contentPadding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              BorderSide(color: Colors.grey, width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
              BorderSide(color: Colors.blue, width: 2)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(12)),
          errorStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
          prefixIcon: prefixIcon),
    );
  }
}
