import 'package:flutter/cupertino.dart';

class AdminController extends ChangeNotifier{

  int selectedIndex = 0; //index of botton nav bar
  void changeScreen(int value) {
    selectedIndex = value;
    notifyListeners();
  }
}