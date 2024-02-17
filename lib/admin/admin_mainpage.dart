import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/admin/view/eventAdd.dart';
import 'package:tailmate/admin/view/petListview.dart';
import 'package:tailmate/admin/view/userlistview.dart';
import 'package:tailmate/admin/widgets/googleNavbar.dart';
import 'package:tailmate/controller/adminController.dart';

class AdminMain extends StatelessWidget {
  const AdminMain({super.key});

  @override
  Widget build(BuildContext context) {
    final List pages=[
      UserList(),
      PetList(),
      EventsAdd()
    ];
    final controller=Provider.of<AdminController>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar:GoogleNav(
        onTabChange: (int value ) => controller.changeScreen(value),),
      body: pages[controller.selectedIndex],
    );
  }
}
