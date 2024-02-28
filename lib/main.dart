import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/admin/admin_mainpage.dart';
import 'package:tailmate/admin/view/eventAdd.dart';
import 'package:tailmate/admin/view/event_view.dart';
import 'package:tailmate/admin/view/petListview.dart';
import 'package:tailmate/controller/adminController.dart';
import 'package:tailmate/controller/firebaseAuthController.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/controller/location.dart';
import 'package:tailmate/controller/mainController.dart';
import 'package:tailmate/firebase_options.dart';
import 'package:tailmate/services/auth_gate.dart';
import 'package:tailmate/view/Event_view/events_view.dart';
import 'package:tailmate/view/Login_page/login_page.dart';
import 'package:tailmate/view/MainPage/mainScreen.dart';
import 'package:tailmate/view/MainPage/pages/add_pet.dart';
import 'package:tailmate/view/MainPage/pages/chat.dart';
import 'package:tailmate/view/MainPage/pages/chat_listPage.dart';
import 'package:tailmate/view/MainPage/pages/home.dart';
import 'package:tailmate/view/MainPage/pages/notifications.dart';
import 'package:tailmate/view/MainPage/pages/wishlist.dart';
import 'package:tailmate/view/MyPets/mypets.dart';
import 'package:tailmate/view/MyPets/petCardView.dart';
import 'package:tailmate/view/MyPets/updatePet.dart';
import 'package:tailmate/view/onboard_screen/onboard_screen.dart';
import 'package:tailmate/view/password_reset_screen/password_reset.dart';
import 'package:tailmate/view/profile_page/components/updateTextField.dart';
import 'package:tailmate/view/profile_page/profile.dart';
import 'package:tailmate/view/signup_page/signup_screen.dart';
import 'controller/adoptionController.dart';
import 'controller/messageController.dart';

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
ChangeNotifierProvider(create:  (context) => AdminController(),),
ChangeNotifierProvider(create:  (context) => AdoptController(),),
ChangeNotifierProvider(create:  (context) => MessageController(),),
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
        "/profile":(context) => MyProfile(),
        "/admin":(context) => AdminMain(),
        "/userpets":(context) => UserPets(),
        "/addevent":(context) => EventsAdd(),
        "/events":(context) => ViewEventsAdmin(),
        "/notification":(context) => Notifications(),
        "/chatlist":(context) => ChatListPage(),
        "/chatpage":(context) => ChatPage(),
        "/eventsview":(context) => EventsView(),
        "/updatedata":(context) => UpdateField(),
        "/authcheck":(context) => AuthGate(),
        "/passreset":(context) => PassReset(),

      },
      initialRoute:'/authcheck',
    );
  }
}
