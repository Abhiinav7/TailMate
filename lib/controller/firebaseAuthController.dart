import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/model/userModel.dart';

class FirebaseAuthController extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController logPassController = TextEditingController();
  final TextEditingController logEmailController = TextEditingController();
  UserController firebaseCloudController = UserController();

//for viewing password on login screen
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  visibleChange() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

//for viewing password on signup screen
  bool _isVisiblez = true;

  bool get isVisiblez => _isVisiblez;

  visibleChangez() {
    _isVisiblez = !_isVisiblez;
    notifyListeners();
  }

//for viewing password on signup screen
  bool _isVisibles = true;

  bool get isVisibles => _isVisibles;

  visibleChanges() {
    _isVisibles = !_isVisibles;
    notifyListeners();
  }

//for checking checkbox on remember me
  bool _isChecked = false;

  bool get isChecked => _isChecked;

  rememberChange(bool value) {
    _isChecked = value;
    notifyListeners();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  createUser(BuildContext context) async {
    final navigator = Navigator.of(context);
    try {
      final authRef = await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      User? user = authRef.user;
      String userId = authRef.user!.uid;
      if (userId.isNotEmpty) {
        final userDetails = UserModel(
            name: nameController.text.trim(),
            id: userId,
            phone: phoneController.text.trim(),
            email: emailController.text.trim());
        firebaseCloudController.userDetailsAdd(userId, userDetails);
        navigator.pushReplacementNamed('/main');
        Fluttertoast.showToast(msg: "SIGN UP SUCCESSFUL");
      } else {
        Fluttertoast.showToast(msg: "Authentication Error");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(msg: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg: 'The account already exists for that email.');
      } else {
        Fluttertoast.showToast(msg: 'Error: ${e.message}');
      }
    }
    notifyListeners();
  }

  loginUser(BuildContext context) async {
    final navigator = Navigator.of(context);
    try {
      final authRef = await auth.signInWithEmailAndPassword(
          email: logEmailController.text, password: logPassController.text);
      User? user = authRef.user;

      if (user!.uid.isNotEmpty) {
        navigator.pushReplacementNamed('/main');
        Fluttertoast.showToast(msg: "LOGIN SUCCESSFUL");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        Fluttertoast.showToast(msg: 'Invalid email format');
      } else if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            action: SnackBarAction(label: "try again", onPressed: () {}),
            behavior: SnackBarBehavior.floating,
            content: Text("email or password is incorrect")));
      } else if (e.code == "user-not-found") {
        Fluttertoast.showToast(msg: "User not found");
      } else if (e.code == "wrong-password") {
        Fluttertoast.showToast(msg: "Incorrect password");
      } else if (e.code == "user-disabled") {
        Fluttertoast.showToast(msg: "User account has been disabled");
      } else {
        Fluttertoast.showToast(msg: "An error occurred: ${e.message}");
      }
    }
    notifyListeners();
  }

  signInWithGoogle(BuildContext context) async {
    final navigator = Navigator.of(context);
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult =
            await FirebaseAuth.instance.signInWithCredential(credential);

        User? user = authResult.user;
        if (user != null) {
          final userModel = UserModel(
              name: user.displayName.toString(),
              id: user.uid,
              phone: user.phoneNumber.toString(),
              email: user.email.toString());
          firebaseCloudController.userDetailsAdd(user.uid, userModel);
          navigator.pushReplacementNamed('/main');
          Fluttertoast.showToast(msg: "GOOGLE SIGN IN SUCCESSFUL");
        } else {
          Fluttertoast.showToast(
              msg: "Google sign in failed", gravity: ToastGravity.BOTTOM);
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error during sign-in: $e');
      return null;
    }
    notifyListeners();
    return null;
  }


  signOut(BuildContext context) async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();
    navigator
        .pushReplacementNamed("/login");
  }
}
