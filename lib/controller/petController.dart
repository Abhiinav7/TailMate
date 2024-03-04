import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/model/petModel.dart';

class PetController extends ChangeNotifier {
//page controller
  int selectedIndex = 0; //index of botton nav bar
  void changeScreen(int value) {
    selectedIndex = value;
    notifyListeners();
  }


  UserController userController = UserController();
  final List<String> petTypesList = [
    "Cat",
    "Dog",
    "Rabbit",
    "bird",
    "other"
  ];

  final TextEditingController petNameController = TextEditingController();
  final TextEditingController petDiscriptionController = TextEditingController();
  final TextEditingController petWeightController = TextEditingController();
  final TextEditingController petBreedController = TextEditingController();
  final TextEditingController petAgeController = TextEditingController();
   String petType=" ";
  String petGender = " ";


  petTyp(String value) {
    petType = value;
    notifyListeners();
  }

  petGen(String value) {
    petGender = value;
    notifyListeners();
  }
void dataClear(){
   petNameController.clear();
   petDiscriptionController.clear();
   petWeightController.clear();
   petAgeController.clear();
   petBreedController.clear();
   petType=" ";
   petGender = " ";
   img = null;
   imageName='';
   imgUrl=" ";
   notifyListeners();
}
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection("pets");
  CollectionReference userCollection =
  FirebaseFirestore.instance.collection("user");


  File? img;
  String imageName='';
  late XFile files;

  //function for picking image from gallery
  Future imagePickCamera() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
    files = file!;
    print('${file.path}');
    final imgTemp = File(file.path);
    this.img = imgTemp;
    String imgName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    imageName = imgName;
    notifyListeners();
  }

  Future imagePickGallery() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    files = file!;
    print('${file.path}');
    final imgTemp = File(file.path);
    this.img = imgTemp;
    String imgName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    imageName = imgName;
    notifyListeners();
  }

  var imgUrl = " ";

  //function to add pet image to firebase storage and call the function to add pet details to cloud store
  Future addPetData({required String imageName, required XFile image,required String userPhone,required String userName,required String userId}) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
    referenceRoot.child("Pet Images").child(userId);
    Reference referenceImageToUpload =
    referenceDirImages.child(imageName + ".png");
    try {
      await referenceImageToUpload.putFile(File(image.path));
      var imageUrl = await referenceImageToUpload.getDownloadURL();
      imgUrl = imageUrl;
      notifyListeners();
      print(imageUrl);
      var tim = DateTime.now();
      final petData = PetModel(
        userPhone:userPhone,
        userName: userName,
        time: tim.toString(),
        petType: petType,
        petName: petNameController.text,
        breed: petBreedController.text,
        gender: petGender,
        age: int.parse(petAgeController.text),
        weight: double.parse(petWeightController.text),
        discription: petDiscriptionController.text,
        imageUrl: imageUrl,
        petId: collectionReference
            .doc()
            .id,
        userId: userId,
      );
      addPetDetails(petData, tim.toString());
    } on FirebaseException catch (error) {
      print(error.code);
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      print("error occured : ${e}");
    }
  }

  //function to add pet details to firebase cloud store
  Future addPetDetails(PetModel petModel, var time) async {
    try {
     await collectionReference.doc(time).set(petModel.toJson()).then((value) => dataClear());
    } catch (e) {
      print("/////////////error$e");
    }
  }

  Future addWishlist(Map<String,dynamic> data,String userId) async {
    try {
      var time = DateTime.now();
      userCollection
          .doc(userId)
          .collection("wishlist")
          .doc(time.toString())
          .set({
        "discription":data["discription"],
        "gender":data["gender"],
        "petType":data["petType"],
        "weight":data["weight"],
        "age":data["age"],
        "petName": data["petName"],
        "breed": data["breed"],
        "imageUrl": data["imageUrl"],
        "time": time.toString()
      });
    } catch (e) {
      print("///////////////error${e}");
    }
  }

  Future deleteWishlist(time,String userId) async {
    try {
      userCollection
          .doc(userId)
          .collection("wishlist")
          .doc(time).delete();
    } catch (e) {
      print(e);
    }
  }

  Future petDetailsUpdate(final imageName, XFile image, var tim,String userId) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
    referenceRoot.child("Pet Images").child(userId);
    Reference referenceImageToUpload =
    referenceDirImages.child(imageName + ".png");
    try {
      await referenceImageToUpload.putFile(File(image.path));
      var imageUrl = await referenceImageToUpload.getDownloadURL();
      imgUrl = imageUrl;
      notifyListeners();
      print(imageUrl);
      final petData = PetModel(
        userPhone: userController.userDetails["phone"],
        userName: userController.name,
        time: tim.toString(),
        petType: petType,
        petName: petNameController.text,
        breed: petBreedController.text,
        gender: petGender,
        age: int.parse(petAgeController.text),
        weight: double.parse(petWeightController.text),
        discription: petDiscriptionController.text,
        imageUrl: imageUrl,
        petId: collectionReference
            .doc()
            .id,
        userId: userId,
      );
      collectionReference.doc(tim).update(petData.toJson());

    } on FirebaseException catch (error) {
      print(error.code);
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      print("error occured : ${e}");
    }
  }

  Future myPetDelete(time)async{
    try{
      collectionReference.doc(time).delete();

    }
    on FirebaseException catch (error) {
      print(error.code);
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      print("error occured : ${e}");
    }
  }
}
