import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/view/MainPage/pages/add_pet.dart';
import 'package:tailmate/view/MainPage/pages/home.dart';
import 'package:tailmate/view/MainPage/pages/chat.dart';
import 'package:tailmate/view/MainPage/pages/wishlist.dart';
import 'package:tailmate/view/MainPage/widgets/google_navbar.dart';
class MainScreen extends StatelessWidget {
   MainScreen({super.key});
   final List<Widget> pages=[
     HomeScreen(),
     AddPetScreen(),
     WishlistPets(),
     MyChat.MyChat()
   ];
  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<PetController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:GoogleNavbar(
        onTabChange: (int value ) => controller.changeScreen(value),),
body: pages[controller.selectedIndex],
    );
  }
}
