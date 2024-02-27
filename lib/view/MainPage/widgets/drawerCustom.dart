import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/firebaseAuthController.dart';
import 'package:tailmate/controller/userController.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);
    final firebaseController = Provider.of<FirebaseAuthController>(context);
    double screenWidth = ScreenUtil.Width(context);
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.indigo.shade50,
      width: screenWidth - 70,
      surfaceTintColor: Color(0xff265073),
      // shadowColor: Colors.red,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Color(0xff265073)),
            currentAccountPicture:
           controller.profileUrl=="" ? CircleAvatar(
             backgroundImage: AssetImage("assets/images/user.png",),
           ):
           Container(
             height: 100,
             width: 100,
             child: ClipRRect(
               borderRadius: BorderRadius.circular(56),
               child: CachedNetworkImage(
                   fit: BoxFit.cover,
                   imageUrl: controller.profileUrl!),
             ),
           ),
            accountName: Text(
              controller.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            accountEmail: Text(controller.email,
                style: TextStyle(color: Colors.white, fontSize: 16),
          ),),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.indigo,
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
            title: Text(
              "Profile",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.person,
              size: 25,
            ),
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.indigo,
            onTap: () {
              Navigator.pushNamed(context, "/eventsview");
            },
            title: Text(
              "Events",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.event_note_rounded,
              size: 25,
            ),
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.indigo,
            onTap: () {
              Navigator.pushNamed(context, "/notification");
            },
            title: Text(
              "Notifications",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.notifications_active_outlined,
              size: 25,
            ),
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.indigo,
            onTap: () {
              Navigator.pushNamed(context, "/mypets");
            },
            title: Text(
              "My Pets",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.pets_sharp,
              size: 25,
            ),
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.indigo,
            onTap: () {},
            title: Text(
              "Settings",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.settings,
              size: 25,
            ),
          ),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.indigo,
            onTap: () {
              firebaseController.signOut(context);
            },
            title: Text(
              "Logout",
              style: TextStyle(fontSize: 20),
            ),
            leading: Icon(
              Icons.logout_outlined,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
