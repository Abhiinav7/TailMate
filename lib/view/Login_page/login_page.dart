import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/Utils/constants/images.dart';
import 'package:tailmate/Utils/constants/texts.dart';
import 'package:tailmate/controller/firebaseAuthController.dart';
import 'package:tailmate/services/validation_services.dart';
import 'package:tailmate/view/signup_page/signup_screen.dart';
import 'package:tailmate/widgets/CustomTextfield.dart';
import 'package:tailmate/widgets/customDivider.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

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
                            height: 110,
                            width: 140,
                            image: AssetImage(ImagesUsed.brand)),
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
                  key: _formkey,
                    child: Consumer<FirebaseAuthController>(
                     builder: (context, AuthController, child) => Column(
                       children: [
                       MyTextfields(
                         horizontalPadding: 8,
                             verticalPadding: 15,
                             prefixIcon: Image.asset("assets/icons/mail.png"),
                             keyboardType: TextInputType.emailAddress,
                             controller: AuthController.logEmailController,
                             validator:(value)=> Validation.validateEmail(value),
                             hintText: 'E-mail ',
                           ),
                         SizedBox(
                           height: 12,
                         ),
                         MyTextfields(
                           horizontalPadding: 8,
                           verticalPadding: 15,
                             suffixIcon: AuthController.isVisible?
                             IconButton(
                               icon: Icon(
                                 CupertinoIcons.eye_slash ,
                               ),
                               onPressed: () {
                                 AuthController.visibleChange();
                               },
                             )
                                 :
                             IconButton(
                               icon: Icon(
                                 Icons.remove_red_eye_outlined,
                               ),
                               onPressed: () {
                                 AuthController.visibleChange();
                               },
                             ),
                             prefixIcon: Image.asset("assets/icons/password.png"),
                             keyboardType: TextInputType.emailAddress,
                             controller: AuthController.logPassController,
                             validator:(value)=> Validation.validatePassword(value),
                             hintText: 'Password ',
                             obscureText: AuthController.isVisible,

                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Row(
                               children: [
                                 Checkbox(
                                     value: AuthController.isChecked,
                                     onChanged: (v) {
                                       AuthController.rememberChange(v!);
                                     }
                                 ),
                                 const Text("Remember me")
                               ],
                             ),
                             Row(
                               children: [
                                 TextButton(
                                     onPressed: () {
                                       Navigator.pushNamed(context, "/passreset");
                                       // AuthController.forgotPass();
                                     },
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
                                 onPressed: () {
                                   if(_formkey.currentState!.validate()){
                                     _formkey.currentState!.save();
                                     AuthController.loginUser(context);
                                   }
                                 }, child: Text("Sign in"))),
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
      ),
    );
  }
}

