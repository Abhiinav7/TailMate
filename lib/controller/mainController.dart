import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MainController extends ChangeNotifier{
  int selectedIndex=0;//index of botton nav bar
void changeScreen(int value){
  selectedIndex=value;
  notifyListeners();
}

  var name='';
var email=' ';
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection("user");
  Future getName()async{
    final userId=FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot docSnapshot = await collectionReference.doc(userId).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      name = data?['name'];
      notifyListeners();
      email=data?["email"];
      notifyListeners();



    }
  }

}