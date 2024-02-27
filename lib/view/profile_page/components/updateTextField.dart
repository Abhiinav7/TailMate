import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/userController.dart';

import '../../../widgets/CustomTextfield.dart';

class UpdateField extends StatelessWidget {
  UpdateField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UserController>(context);
    final data = ModalRoute.of(context)!.settings.arguments as List;
    String field = data[0];
    String userData = data[1];
    controller.fieldController.text = userData;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Update ${field}",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.teal),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Please enter your new ${field} below.",
              style: GoogleFonts.jaldi(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextfields(
              controller: controller.fieldController,
              horizontalPadding: 10,
              validator: (v) {},
              keyboardType: TextInputType.name,
              hintText: 'Enter Name',
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  if (controller.fieldController.text.isNotEmpty) {
                    controller
                        .updateField(field)
                        .then((value) => Navigator.pop(context))
                        .then((value) =>
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("profile will updated shortly"),
                              behavior: SnackBarBehavior.floating,
                            )));
                  }
                },
                child: Text("Update"))
          ],
        ),
      ),
    );
  }
}
