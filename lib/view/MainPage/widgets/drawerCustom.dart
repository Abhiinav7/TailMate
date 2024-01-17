import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/mainController.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<MainController>(context);
    double screenWidth = ScreenUtil.Width(context);
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.indigo.shade50,
      width: screenWidth - 70,
      surfaceTintColor: Colors.indigo,
      // shadowColor: Colors.red,
      child: ListView(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                color: Colors.indigo.shade600,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "assets/images/person.jpg",
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(controller.email,
                            style: TextStyle(color: Colors.white, fontSize: 15))
                      ],
                    )
                  ],
                ),
              )),
          ListTile(
            textColor: Colors.black,
            iconColor: Colors.indigo,
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
