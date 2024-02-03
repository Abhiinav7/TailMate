import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/firebaseAuthController.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/controller/location.dart';
import 'package:tailmate/controller/mainController.dart';
import 'package:tailmate/firebase_options.dart';

import 'package:tailmate/view/Login_page/login_page.dart';
import 'package:tailmate/view/MainPage/mainScreen.dart';
import 'package:tailmate/view/MainPage/pages/add_pet.dart';
import 'package:tailmate/view/MainPage/pages/home.dart';
import 'package:tailmate/view/MainPage/pages/wishlist.dart';
import 'package:tailmate/view/MyPets/mypets.dart';
import 'package:tailmate/view/MyPets/petCardView.dart';
import 'package:tailmate/view/MyPets/updatePet.dart';
import 'package:tailmate/view/onboard_screen/onboard_screen.dart';
import 'package:tailmate/view/signup_page/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MultiProvider(
      providers: [
ChangeNotifierProvider(create:  (context) => FirebaseAuthController(),),
ChangeNotifierProvider(create:  (context) => MainController(),),
ChangeNotifierProvider(create:  (context) => LocationController(),),
ChangeNotifierProvider(create:  (context) => UserController(),),
ChangeNotifierProvider(create:  (context) => PetController(),),
      ],
  child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TailMate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      //home: const OnboardScreen(),
      routes: {
        "/onBoard":(context) =>OnboardScreen(),
        "/login":(context) =>LoginScreen(),
        "/create":(context) =>SignupScreen(),
        "/main":(context) =>MainScreen(),
        "/home":(context) =>HomeScreen(),
        "/wishlist":(context) =>WishlistPets(),
        "/addpet":(context) => AddPetScreen(),
        "/mypets":(context) => MyPets(),
        "/updatepet":(context) => UpdatePet(),
        "/petview":(context) => PetCardView(),

      },
      initialRoute:'/onBoard',
    );
  }
}
