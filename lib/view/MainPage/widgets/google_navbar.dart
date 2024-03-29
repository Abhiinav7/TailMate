import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';

class GoogleNavbar extends StatelessWidget {
  void Function(int)? onTabChange;

  GoogleNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PetController>(context);
    return GNav(

      backgroundColor: Colors.white,
      selectedIndex: controller.selectedIndex,
      textStyle: GoogleFonts.alata(
        fontSize: 14,
        color: Colors.indigo,
        fontWeight: FontWeight.w600,
      ),
      haptic: false,
      rippleColor: Colors.blueGrey.shade100,
      hoverColor: Colors.grey,
      iconSize: 24,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      color: Colors.black,
      activeColor: Colors.indigo[700],
      tabBackgroundColor: Colors.grey.shade200,
      tabBorderRadius: 30,
      tabActiveBorder: Border.all(color: Colors.white60),
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 500),
      gap: 2,
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
        ),
        GButton(
          icon: Icons.add_circle,
          text: 'Sell',
        ),
        GButton(
          icon: Icons.favorite_rounded,
          text: 'Pawlist',
        ),
        GButton(
          icon: Icons.chat,
          text: 'Chat',
        )
      ],
      onTabChange: onTabChange,
    );
  }
}
