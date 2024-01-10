import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';

import 'package:tailmate/view/Login_page/login_page.dart';
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.Width(context);
    double screenHeight = ScreenUtil.Height(context);
    final List<Introduction> list = [
      Introduction(
        imageHeight: screenHeight * 0.35,
        imageWidth:screenWidth * 0.92,
        subTitleTextStyle: GoogleFonts.aleo(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),
        titleTextStyle:  GoogleFonts.allertaStencil(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.black),
        title: 'Welcome to TailMate',
        subTitle: 'Lets Make Tails Wag Together!',
        imageUrl: 'assets/onboard/onboard1.json',
      ),
      Introduction(
        imageHeight: screenHeight * 0.35,
        imageWidth:screenWidth * 0.92,
        subTitleTextStyle: GoogleFonts.aleo(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),
        titleTextStyle:  GoogleFonts.allertaStencil(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.black),
        title: 'Discover Your New Best Friend',
        subTitle: 'Lets embark on a journey of love and companionship',
        imageUrl: 'assets/onboard/onboard2.json',
      ),
      Introduction(
        imageHeight: screenHeight * 0.35,
        imageWidth:screenWidth * 0.96,
        subTitleTextStyle: GoogleFonts.aleo(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.black54),
        titleTextStyle:  GoogleFonts.allertaStencil(fontSize: 23,fontWeight: FontWeight.w900,color: Colors.black),
        title: 'Meet Your Furry Soulmate',
        subTitle: 'Start your journey with unconditional love',
        imageUrl: 'assets/onboard/onboard3.json',
      ),

    ];
    return  IntroScreenOnboarding(
      backgroudColor: Colors.white,
      skipTextStyle: TextStyle(
        fontSize: 16,
      ),
      introductionList: list,
      onTapSkipButton: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ), //MaterialPageRoute
        );
      },
    );
  }
}
