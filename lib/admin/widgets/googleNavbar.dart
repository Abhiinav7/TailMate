import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';

class GoogleNav extends StatelessWidget {
  void Function(int)? onTabChange;

  GoogleNav({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PetController>(context);
    return GNav(

      backgroundColor: Colors.white,
      selectedIndex: controller.selectedIndex,
      textStyle: GoogleFonts.alata(
        fontSize: 15,
        color: Colors.indigo,
        fontWeight: FontWeight.w600,
      ),
      haptic: false,
      rippleColor: Colors.blueGrey.shade100,
      hoverColor: Colors.grey,
      iconSize: 25,
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
          icon: Icons.person,
          text: 'User',
        ),
        GButton(
          icon: Icons.pets_sharp,
          text: 'Pets',
        ),
        GButton(
          icon: Icons.event_note_rounded,
          text: 'Events',
        ),

      ],
      onTabChange: onTabChange,
    );
  }
}
