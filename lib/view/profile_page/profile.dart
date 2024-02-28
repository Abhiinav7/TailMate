import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/view/profile_page/components/profileDetailsTab.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                      value.profileUrl==""? CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              AssetImage("assets/images/user.png"),
                        ):
                      Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(56),
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: value.profileUrl!),
                        ),
                      ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: (){
                            value.uploadProfilepic();
                          },
                          child: Text(
                            "Change Profile Picture",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Divider(),
                        Row(
                          children: [
                            Text(
                              "Personal Information",
                              style: GoogleFonts.k2d(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ProfileDetailsTab(
                          name: "Name",
                          value: value.userDetails["name"],
                          onPressed: () {
                            Navigator.pushNamed(context, "/updatedata",
                                arguments: ["name", value.userDetails["name"]]);
                          },
                        ),
                        ProfileDetailsTab(
                          name: "phone",
                          value: value.userDetails["phone"]==""?"add phone number":value.userDetails["phone"],
                          onPressed: () {
                            Navigator.pushNamed(context, "/updatedata",
                                arguments: [
                                  "phone",
                                  value.userDetails["phone"]
                                ]);
                          },
                        ),
                        ProfileDetailsTab(
                          name: "email",
                          value: value.userDetails["email"],
                          onPressed: () {
                            Navigator.pushNamed(context, "/updatedata",
                                arguments: [
                                  "email",
                                  value.userDetails["email"]
                                ]);
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.all(14),
                                    contentTextStyle: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                    title: const Text('Delete your Account?'),
                                    content: const Text(
                                        "Are you sure you want to delete your account?  This action cannot be undone"),
                                    actions: [
                                      TextButton(
                                        child: const Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Delete',
                                            style: TextStyle(
                                              color: Colors.red,
                                            )),
                                        onPressed: () {
                                          value.deleteUserAccount(context);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text("Delete my account"))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
