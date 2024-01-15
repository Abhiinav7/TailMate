import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/mainController.dart';


class GoogleNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
   GoogleNavbar({super.key,required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<MainController>(context);
    return GNav(
      selectedIndex: controller.selectedIndex,
        textStyle: GoogleFonts.alata(
          fontSize: 15,
          color: Colors.indigo,
          fontWeight: FontWeight.w600,
        ),
        haptic: true,
        rippleColor: Colors.blueGrey.shade100,
        hoverColor: Colors.grey,
        iconSize: 28,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        color: Colors.black,
        activeColor: Colors.indigo[700],
        tabBackgroundColor: Colors.grey.shade200,
        tabBorderRadius: 30,
        tabActiveBorder: Border.all(color: Colors.white60),
        curve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        gap: 5,
        tabs: [
          GButton(
            icon: Icons.home,
            text: ' Home',
          ),

          GButton(
            icon: Icons.add_circle,
            text: 'Add',
          ),
          GButton(
            icon: Icons.favorite_rounded,
            text: 'Fav',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          )
        ],
    onTabChange:onTabChange ,);
  }
}
