import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.screenWidth,
    required this.textfield
  });

  final double screenWidth;
final Widget textfield;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 58,
      width: screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 2, color: Colors.grey)),
      child:textfield
    );
  }
}