import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/adminController.dart';
import 'package:tailmate/view/MainPage/widgets/customButton.dart';


class EventsAdd extends StatelessWidget {
  const EventsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.indigo,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Add Events",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.indigo),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 35),
        child: SingleChildScrollView(
          child: Consumer<AdminController>(
            builder: (context, value, child) => Column(

              children: [
                value.img == null
                    ? SizedBox()
                    : Container(
                        constraints: BoxConstraints(
                            maxHeight: 300, maxWidth: double.infinity),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(value.img!))),
                      ),
                SizedBox(
                  height: 50,
                ),
                value.img != null
                    ? TextField(
                        maxLines: 3,
                        controller: value.discriptionController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            hintText: "Description",
                            border: InputBorder.none))
                    : SizedBox(),
                value.img == null
                    ? SizedBox(
                        height: 250,
                      )
                    : SizedBox(
                        height: 60,
                      ),
                value.img == null
                    ? Center(
                        child: MyButton(
                            height: 45,
                            width: 120,
                            onTap: () {
                              value.imagePickGallery();
                            },
                            text: "Choose image"),
                      )
                    : Container(),
                SizedBox(
                  height: 50,
                ),
                value.img != null
                    ? ElevatedButton(
                        style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                                Size(double.infinity, 50))),
                        onPressed: () {
if(value.img != null){
  value.addEvents(value.imageName, value.files,context);
  Navigator.pushReplacementNamed(context, "/events");
}
                        },
                        child: Text("Add"))
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
