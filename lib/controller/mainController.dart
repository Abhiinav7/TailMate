import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  List<String> petCategories = [
    "Dog",
    "Cat",
    "Rabbit",
    "bird",
  ];
  List<String> petImages = [
    "assets/pets/dog.jpg",
    "assets/pets/cat3.jpg",
    "assets/pets/rab2.jpg",
    "assets/pets/bird.jpg",

  ];

}
