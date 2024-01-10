import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/Utils/constants/images.dart';
import 'package:tailmate/Utils/constants/texts.dart';
import 'package:tailmate/view/signup_page/signup_screen.dart';
import 'package:tailmate/widgets/CustomContainer.dart';
import 'package:tailmate/widgets/CustomTextfield.dart';
import 'package:tailmate/widgets/customDivider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    double screenWidth = ScreenUtil.Width(context);
    double screenHeight = ScreenUtil.Height(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 10, bottom: 15, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image(
                            fit: BoxFit.contain,
                            height: 90,
                            width: 120,
                            image: AssetImage(ImagesUsed.logo)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          LoginScreenTexts.welcome,
                          style: GoogleFonts.allertaStencil(
                              fontSize: 23,
                              fontWeight: FontWeight.w900,
                              color: Colors.indigo),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          LoginScreenTexts.introFirst,
                          style: GoogleFonts.aleo(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          LoginScreenTexts.introSecond,
                          style: GoogleFonts.aleo(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Form(
                    child: Column(
                  children: [
                    CustomContainer(
                      screenWidth: screenWidth,
                      textfield: MyTextfields(
                        prefixIcon: Icon(Icons.email_outlined),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {},
                        hintText: 'E-mail ',
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    CustomContainer(
                      screenWidth: screenWidth,
                      textfield: MyTextfields(
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                            )),
                        prefixIcon: Icon(Icons.password_sharp),
                        keyboardType: TextInputType.emailAddress,
                        controller: passController,
                        validator: (value) {},
                        hintText: 'Password ',
                        obscureText: true,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (v) {}),
                            const Text("Remember me")
                          ],
                        ),
                        Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text("Forgot password"))
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Container(
                        height: 45,
                        width: screenWidth,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Sign in"))),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        height: 45,
                        width: screenWidth,
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                            }, child: Text("Create Account"))),
                    SizedBox(
                      height: 40,
                    ),
                    CustomDivider(dividerText: 'or Sign in with',),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: IconButton(
                            icon: Image(
                              height: 30,
                              width: 30,
                              image: AssetImage(
                                ImagesUsed.GoogleLogo,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

