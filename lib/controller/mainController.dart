import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainController extends ChangeNotifier {
  List<String> petCategories = [
    "Cat",
    "Dog",
    "Rabbit",
    "bird",
  ];
  List<String> petImages = [
    "assets/pets/dog.jpg",
    "assets/pets/cat3.jpg",
    "assets/pets/rab2.jpg",
    "assets/pets/bird.jpg",

  ];
// String name="";
// String email="";
//   CollectionReference collectionReference =
//   FirebaseFirestore.instance.collection("user");
//   Future fetchData()async{
//     final userId=FirebaseAuth.instance.currentUser!.uid;
//     final docSnapshot = await collectionReference.doc(userId).get();
//     if (docSnapshot.exists) {
//     final  data =UserModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
//       notifyListeners();
//       // Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
//       name = data.name;
//       notifyListeners();
//       email=data.email;
//       notifyListeners();
//
//
//
//     }
//   }
}
