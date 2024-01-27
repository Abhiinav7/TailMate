import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:tailmate/model/userModel.dart';

class UserController extends ChangeNotifier {
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection("user");

  Future userDetailsAdd(String uid, UserModel userModel) async {
    try {
      await collectionReference.doc(uid).set(userModel.toJson());
    }
    on FirebaseException catch (e) {
      print("/////////////${e.code}////////////");
    }
  }

  String name = "";
  String email = "";
  Future fetchData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docSnapshot = await collectionReference.doc(userId).get();
    if (docSnapshot.exists) {
      final data = UserModel.fromJson(
          docSnapshot.data() as Map<String, dynamic>);
      notifyListeners();
      // Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      name = data.name;
      notifyListeners();
      email = data.email;
      notifyListeners();

    }
  }

}