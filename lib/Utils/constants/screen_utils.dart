import 'package:flutter/material.dart';
class ScreenUtil {
  static double Width(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }

  static double Height(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  static double Text(BuildContext context) {
    return MediaQuery
        .of(context)
        .textScaleFactor;
  }
}