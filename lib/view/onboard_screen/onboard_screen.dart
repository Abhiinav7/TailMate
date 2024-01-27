import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:tailmate/Utils/constants/onboardHelper.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';

import 'package:tailmate/view/Login_page/login_page.dart';
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardHealper helperStyle=OnboardHealper();
    double screenWidth = ScreenUtil.Width(context);
    double screenHeight = ScreenUtil.Height(context);
    double imageHeight= screenHeight * 0.35;
    double imageWidth= screenWidth * 0.92;
    final List<Introduction> list = [
      Introduction(
        imageHeight:imageHeight,
        imageWidth:imageWidth,
        subTitleTextStyle:helperStyle.subTitleStyle,
        titleTextStyle:  helperStyle.TitleStyle,
        title: 'Welcome to TailMate',
        subTitle: 'Lets Make Tails Wag Together!',
        imageUrl: 'assets/onboard/onboard1.json',
      ),
      Introduction(
        imageHeight: imageHeight,
        imageWidth:imageWidth,
        subTitleTextStyle:helperStyle.subTitleStyle,
        titleTextStyle: helperStyle.TitleStyle,
        title: 'Discover Your New Best Friend',
        subTitle: 'Lets embark on a journey of love and companionship',
        imageUrl: 'assets/onboard/onboard2.json',
      ),
      Introduction(
        imageHeight:imageHeight,
        imageWidth:screenWidth * 0.96,
        subTitleTextStyle:helperStyle.subTitleStyle,
        titleTextStyle: helperStyle.TitleStyle,
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
