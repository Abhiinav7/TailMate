import 'package:flutter/material.dart';
class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.dividerText
  });
  final String dividerText;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 40,
              endIndent: 5,
            )),
        Text(
          dividerText,
          style: TextStyle(color: Colors.grey),
        ),
        Flexible(
            child: Divider(
              thickness: 1,
              color: Colors.grey,
              indent: 5,
              endIndent: 40,
            ))
      ],
    );
  }
}
