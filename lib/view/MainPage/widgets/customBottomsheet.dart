import 'package:flutter/material.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/view/MainPage/widgets/customButton.dart';

class CustomBottomSheet {
  void showBottom(BuildContext context) {
    showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 120,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          )),
        );
      },
    );
  }
}
