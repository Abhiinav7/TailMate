import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: (){Navigator.pushReplacementNamed(context, "/main");},
          // ),
          backgroundColor: Colors.transparent,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              "PawChat",
              style: GoogleFonts.aDLaMDisplay(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.indigo),
            ),
          ),
        ),
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("adoption").where("status",isEqualTo: "accepted")
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData?Center(child: Text(""),):ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];
              final datas=data.data() as Map<String,dynamic>;
              return data['ownerId']==FirebaseAuth.instance.currentUser!.uid||data['senderId']==FirebaseAuth.instance.currentUser!.uid?
              Card(
                elevation:3 ,

                child: ListTile(

                  titleTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.indigo,
                    fontWeight: FontWeight.w600
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, "/chatpage",arguments: datas);
                  },
                  title: Text(data['ownerId']==FirebaseAuth.instance.currentUser!.uid?data["senderName"]:data['ownerName']),
                subtitle:  Text(data['ownerId']==FirebaseAuth.instance.currentUser!.uid?data["senderPhone"]:data['ownerPhone']),),
              ):SizedBox();
            });
      },
    ));
  }
}
