import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/images.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/firebaseAuthController.dart';
import 'package:tailmate/services/validation_services.dart';
import 'package:tailmate/widgets/CustomContainer.dart';
import 'package:tailmate/widgets/CustomTextfield.dart';
import 'package:tailmate/widgets/customDivider.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.Width(context);

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
                height: 30,
              ),
              Form(
                  key: _formkey,
                  child: Consumer<FirebaseAuthController>(
                    builder: (context, AuthController, child) =>
                        Column(
                          children: [
                            CustomContainer(
                              screenWidth: screenWidth,
                              textfield: MyTextfields(
                                prefixIcon: Icon(Icons.person_outlined),
                                controller: AuthController.nameController,
                                validator:(value)=> Validation.validateName(value!),
                                keyboardType: TextInputType.name,
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
                                controller: AuthController.emailController,
                                validator:(value)=> Validation.validateEmail(value!),
                                keyboardType: TextInputType.emailAddress,
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
                                controller: AuthController.phoneController,
                                validator:(value)=> Validation.validatePhone(value!),
                                keyboardType: TextInputType.number,
                                hintText: 'Phone',
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomContainer(
                              screenWidth: screenWidth,
                              textfield: MyTextfields(
                                suffixIcon: AuthController.isVisiblez ?
                                IconButton(
                                  icon: Icon(
                                      CupertinoIcons.eye_slash,
                                  ),
                                  onPressed: () {
                                    AuthController.visibleChangez();
                                  },
                                )
                                    :
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined ,
                                  ),
                                  onPressed: () {
                                    AuthController.visibleChangez();
                                  },
                                ),
                                prefixIcon: Image.asset("assets/icons/password.png"),
                                controller: AuthController.passwordController,
                                validator:(value)=> Validation.validatePassword(value!),
                                keyboardType: TextInputType.visiblePassword,
                                hintText: 'Password',
                                obscureText: AuthController.isVisiblez,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomContainer(
                              screenWidth: screenWidth,
                              textfield: MyTextfields(
                                suffixIcon: AuthController.isVisibles ?
                                IconButton(
                                  icon: Icon(
                                    CupertinoIcons.eye_slash,
                                  ),
                                  onPressed: () {
                                    AuthController.visibleChanges();
                                  },
                                )
                                :
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye_outlined ,
                                  ),
                                  onPressed: () {
                                    AuthController.visibleChanges();
                                  },
                                ),
                                prefixIcon:Image.asset("assets/icons/password.png"),
                                controller: AuthController.confirmPassController,
                                validator:(value)=> Validation.validatePassword(value!),
                                keyboardType: TextInputType.visiblePassword,
                                hintText: 'Confirm Password',
                                obscureText: AuthController.isVisibles,
                              ),
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            Container(
                              height: 45,
                              width: screenWidth,
                              child: ElevatedButton(
                                child: Text("Create Account"),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    _formkey.currentState!.save();
                                    AuthController.createUser(context);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 35,
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
                                    onPressed: () {
                                      AuthController.signInWithGoogle(context);
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
