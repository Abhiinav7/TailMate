import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
   MyButton({
     super.key,
     required this.onTap,
     this.height=30,
     this.width=140,
     // this.isBorder=false,
     required this.text



   });
 void Function()? onTap;
  double height;
  double width;
// bool isBorder;
String text;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onTap,
      child: Container(
        height: height,
        width: width,
        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(2, 2))
        ]),
        child: Center(
          child: Text(
           text,
            style: TextStyle(
                fontSize: 15,
                color: Colors.indigo,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
