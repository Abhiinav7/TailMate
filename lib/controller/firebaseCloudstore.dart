import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tailmate/model/userModel.dart';

class FirebaseCloudController {
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection("user");

  Future userDetailsAdd(String uid,UserModel userModel)async{
    try{
      await collectionReference.doc(uid).set(userModel.toJson());
    }
    on FirebaseException catch(e){
      print("/////////////${e.code}////////////");
    }

  }


}