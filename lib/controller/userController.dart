import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailmate/model/userModel.dart';

class UserController extends ChangeNotifier {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("user");

  Future userDetailsAdd(String uid, UserModel userModel) async {
    try {
      await collectionReference.doc(uid).set(userModel.toJson());
    } on FirebaseException catch (e) {
      print("/////////////${e.code}////////////");
    }
  }

  String name = " ";
  String email = " ";
  String uid = ' ';
  Map<String, dynamic> userDetails = {};
  String profileUrl="";
  // var currentUserId=FirebaseAuth.instance.currentUser!.uid;

  Future fetchData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docSnapshot = await collectionReference.doc(userId).get();
    if (docSnapshot.exists) {
      final data =
          UserModel.fromJson(docSnapshot.data() as Map<String, dynamic>);
      // Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>?;
      name = data.name;
      email = data.email;
      uid = data.id;
      profileUrl=data.profileUrl;
      userDetails = docSnapshot.data() as Map<String, dynamic>;
      notifyListeners();
      return data;
    }
  }

  Future<void> deleteUserAccount(BuildContext ctx) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .delete()
          .then((value) => deleteUserData(ctx));
    } on FirebaseAuthException catch (e) {
      print("error:$e");
    } catch (e) {
      print("error:$e");
    }
  }

  Future<void> deleteUserData(BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(uid)
          .delete()
          .then((value) => Navigator.pushNamed(context, "/login"));
    } catch (e) {
      print(e);
    }
  }

  TextEditingController fieldController = TextEditingController();

  Future<void> updateField(String field) async {
    try {
      await collectionReference
          .doc(uid)
          .update({field: fieldController.text}).then(
              (value) => fieldController.clear());
    } catch (e) {
      print(e);
    }
  }



  Future uploadProfilepic() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');
    if (file == null) return;
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceRoot.child('profile picture').child(uid);

    Reference referenceImageToUpload =
        referenceDirImages.child(uniqueFileName + ".png");

    try {
      await referenceImageToUpload.putFile(File(file.path));
      var imageUrl;
      imageUrl = await referenceImageToUpload
          .getDownloadURL();
      print(imageUrl);
      addDptoFirestore(imageUrl);
      profileUrl = imageUrl;
      notifyListeners();
    } catch (error) {
      //Some error occurred
    }
  }

  Future addDptoFirestore(String profileUrl) async {
    await collectionReference.doc(uid).update({"profileUrl": profileUrl});
  }

}
