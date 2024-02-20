import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ViewEvents extends StatelessWidget {
  const ViewEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Events",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.teal),
          ),
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
           Navigator.pushNamed(context, "/addevent");
          },
        child: Icon(Icons.add),
      ),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection("events").snapshots(),
      //   builder: (context, snapshot) {
      //
      //   },
      // ),
    );
  }
}
