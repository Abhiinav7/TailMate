import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailmate/Utils/constants/images.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/widgets/CustomContainer.dart';
import 'package:tailmate/widgets/CustomTextfield.dart';
import 'package:tailmate/widgets/customDivider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.Width(context);
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Let's Create Your Account.",
                    style: GoogleFonts.aDLaMDisplay(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.indigo),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  child: Column(
                children: [
                  CustomContainer(
                    screenWidth: screenWidth,
                    textfield: MyTextfields(
                      prefixIcon: Icon(Icons.person_outlined),
                      controller: nameController,
                      validator: (value) {},
                      keyboardType: null,
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    screenWidth: screenWidth,
                    textfield: MyTextfields(
                      prefixIcon: Icon(Icons.email_outlined),
                      controller: nameController,
                      validator: (value) {},
                      keyboardType: null,
                      hintText: 'E-mail',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    screenWidth: screenWidth,
                    textfield: MyTextfields(
                      prefixIcon: Icon(Icons.local_phone_outlined),
                      controller: nameController,
                      validator: (value) {},
                      keyboardType: null,
                      hintText: 'Phone',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    screenWidth: screenWidth,
                    textfield: MyTextfields(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {},
                      ),
                      prefixIcon: Icon(Icons.password_sharp),
                      controller: nameController,
                      validator: (value) {},
                      keyboardType: null,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(
                    screenWidth: screenWidth,
                    textfield: MyTextfields(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {},
                      ),
                      prefixIcon: Icon(Icons.password_sharp),
                      controller: nameController,
                      validator: (value) {},
                      keyboardType: null,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 45,
                    width: screenWidth,
                    child: ElevatedButton(
                      child: Text("Create Account"),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomDivider(dividerText: "Or Sign up with"),
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
    );
  }
}
