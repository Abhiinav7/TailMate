import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/model/petModel.dart';
import 'package:tailmate/model/userModel.dart';

class PetController extends ChangeNotifier {
  UserController userController=UserController();
  final List<String> petTypesList = [
    "Cat",
    "Dog",
    "Rabbit",
    "birds",
    "fish",
    "other"
  ];

  final TextEditingController petNameController = TextEditingController();
  final TextEditingController petDiscriptionController =
      TextEditingController();
  final TextEditingController petWeightController = TextEditingController();
  final TextEditingController petBreedController = TextEditingController();
  final TextEditingController petAgeController = TextEditingController();
  String _petType = " ";
  String _petGender = " ";

  String get petGender => _petGender;

  petTyp(String value) {
    _petType = value;
    notifyListeners();
  }

  petGen(String value) {
    _petGender = value;
    notifyListeners();
  }

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("pets");
  final userId = FirebaseAuth.instance.currentUser!.uid;


  File? img;
  String imageName = " ";
  late XFile files;
// UserModel? userModel;
  //function for picking image from gallery
  Future<Object> imagePick() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    files = file!;
    notifyListeners();
    print('${file?.path}');
    if (file == null) return "";
    final imgTemp = File(file.path);
    this.img = imgTemp;
    notifyListeners();
    String imgName = DateTime.now().millisecondsSinceEpoch.toString();
    imageName = imgName;
    notifyListeners();
    // Map<String,dynamic> data=userController.fetchData() as Map<String, dynamic>;
    // userModel=data as UserModel?;
    notifyListeners();
    // final imgUrl=addPetData(imgName, file);
    return file;
  }

  //function to add pet image to firebase storage and call the function to add pet details to cloud store
  Future addPetData(final imageName, XFile image) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages =
        referenceRoot.child("Pet Images").child(userId);

    Reference referenceImageToUpload =
        referenceDirImages.child(imageName + ".png");
    try {
      await referenceImageToUpload.putFile(File(image.path));
      var imageUrl = await referenceImageToUpload.getDownloadURL();
      print(imageUrl);
      final petData = PetModel(
          petType: _petType,
          petName: petNameController.text,
          breed: petBreedController.text,
          gender: petGender,
          age: int.parse(petAgeController.text),
          weight: double.parse(petWeightController.text),
          discription: petDiscriptionController.text,
          imageUrl: imageUrl,
          petId: collectionReference.doc().id,
          userId: userId,
          );
      addPetDetails(petData);
    } on FirebaseException catch (error) {
      print(error.code);
    } on PlatformException catch (e) {
      print(e.code);
    } catch (e) {
      print("error occured ${e}");
    }
  }

  //function to add pet details to firebase cloud store
  Future addPetDetails(PetModel petModel) async {
    try {
      collectionReference.add(petModel.toJson());
    } catch (e) {
      print("/////////////error$e");
    }
  }
}
