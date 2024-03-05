import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/adminController.dart';

class ViewEventsAdmin extends StatelessWidget {
  const ViewEventsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final adminController = Provider.of<AdminController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Events",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.indigo),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addevent");
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("events").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final events = snapshot.data!.docs[index];
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        adminController.deleteEvent(events["time"]);
                      } else {
                        adminController.deleteEvent(events["time"]);
                      }
                    },
                    child: Card(
                      color: Colors.indigo,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 250,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: CachedNetworkImage(
                              fit: BoxFit.fill, imageUrl: events["imgUrl"]),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: Text("No events"),
            );
          }
        },
      ),
    );
  }
}
