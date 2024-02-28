import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../view/MainPage/mainScreen.dart';
import '../view/onboard_screen/onboard_screen.dart';
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MainScreen();
        } else {
          return OnboardScreen();
        }
      },
    );
  }
}
