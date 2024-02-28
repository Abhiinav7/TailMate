import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/firebaseAuthController.dart';

class PassReset extends StatelessWidget {
  PassReset({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FirebaseAuthController>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Forgot Password',
            style:
                GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please enter your Emailaddress to',
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
              Text('to recieve a reset link',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.amber)),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    icon: Icon(Icons.email_outlined), hintText: "Enter Email"),
                controller: value.passReset,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: GestureDetector(
                  onTap: () {
                    value.forgotPass();
                  },
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                        child: Text(
                      "Send reset link",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
