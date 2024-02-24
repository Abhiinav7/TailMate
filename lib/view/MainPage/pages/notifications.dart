import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/adoptionController.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final adoptController=Provider.of<AdoptController>(context);
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
            "Notification",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.teal),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("adoption")
            .where('recipient',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data=snapshot.data!.docs[index];
                 return Card(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("You Have Recieved an Enquiry from ${data["senderName"]}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,

                          ),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {
                                  adoptController.rejectRequest(data["time"]);
                                }, child: Text("Reject")),
                            TextButton(
                                onPressed: () {
                                  adoptController.acceptRequest(data["time"]);
                                }, child: Text("Accept")),
                          ],
                        )
                      ],
                    ),
                  );
                }
            );
          } else {
            return Center(
              child: Text("You Dont Have Any Notifications"),
            );
          }
        },
      ),
    );
  }
}
