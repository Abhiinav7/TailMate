import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PetController extends ChangeNotifier {
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController petDiscriptionController = TextEditingController();
  final TextEditingController petWeightController = TextEditingController();
  final petKey=GlobalKey<FormState>();

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("user");
  final userId = FirebaseAuth.instance.currentUser!.uid;

  
  String urlImage = '';

  Future addPetData(final imageName, XFile image) async {

    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('PetImages');
    Reference referenceImageToUpload =
        referenceDirImages.child(imageName + ".png");
    try {
      //Store the file
      await referenceImageToUpload.putFile(File(image.path));
      //Success: get the download URL
      var imageUrl = await referenceImageToUpload.getDownloadURL();
      collectionReference.doc(userId).set({"url": imageUrl});
      print(imageUrl);
    } on FirebaseException catch (error) {
      print(error.code);
      //Some error occurred
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      print("error occured ${e}");
    }
  }
}
