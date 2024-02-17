import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/view/profile_page/components/profileDetailsTab.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/person.jpg"),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      child: Text("Change Profile Picture",style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400
                      ),),
                    ),
                    SizedBox(height: 14,),
                    Divider(),
                    Row(
                      children: [
                        Text(
                          "Personal Information",
                          style: GoogleFonts.k2d(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    ProfileDetailsTab(name:"Name" ,value: controller.userDetails["name"], onPressed: () {  },),
                    ProfileDetailsTab(name: "phone",value: controller.userDetails["phone"], onPressed: () {  },),
                    ProfileDetailsTab(name: "email",value: controller.userDetails["email"], onPressed: () {  },),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


