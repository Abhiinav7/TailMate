import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailmate/model/eventModel.dart';

class AdminController extends ChangeNotifier {

  int selectedIndex = 0; //index of botton nav bar
  void changeScreen(int value) {
    selectedIndex = value;
    notifyListeners();
  }

  signOut(BuildContext context) async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();
    navigator
        .pushReplacementNamed("/login");
  }


  final discriptionController = TextEditingController();

  File? img;
  String imageName = '';
  late XFile files;

  Future imagePickGallery() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    files = file!;
    notifyListeners();
    print('${file?.path}');
    if (file != null) {
      final imgTemp = File(file.path);
      this.img = imgTemp;
      notifyListeners();
      String imgName = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      imageName = imgName;
      notifyListeners();
    }
    return file;
  }

  var imgUrl = " ";

  Future addPetData(final imageName, XFile image) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
    referenceRoot.child("Events");

    Reference referenceImageToUpload =
    referenceDirImages.child(imageName + ".png");
    try {
      await referenceImageToUpload.putFile(File(image.path));
      var imageUrl = await referenceImageToUpload.getDownloadURL();
      imgUrl = imageUrl;
      notifyListeners();
      print(imageUrl);
      var tim = DateTime.now();
      final eventData = EventModel(
          description: discriptionController.text,
          imgUrl: imgUrl,
          time: tim.toString());
      saveEvent(tim.toString(), eventData);
    } on FirebaseException catch (error) {
      print(error.code);
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      print("error occured : ${e}");
    }
  }


  Future saveEvent(var time, EventModel eventModel) async {
    try {
      await FirebaseFirestore.instance.collection("events").doc(time).set(
          eventModel.toJson()).then((value) => dataClear());
    }
    catch (e) {
      print("/////////////////$e");
    }
  }

  void dataClear() {
    discriptionController.clear();
    img = null;
    imageName = '';
    imgUrl = " ";
    notifyListeners();
  }

}