
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tailmate/controller/petController.dart';

class MainController extends ChangeNotifier {
  PetController petController=PetController();
  int selectedIndex = 0; //index of botton nav bar
  void changeScreen(int value) {
    selectedIndex = value;
    notifyListeners();
  }
final img='';
  Future<Object> imagePick() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print('${file?.path}');
    if (file == null) return "";
    String imgName =
    DateTime.now().millisecondsSinceEpoch.toString();
    final imgUrl=petController.addPetData(imgName, file);
    return imgUrl;
  }

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
