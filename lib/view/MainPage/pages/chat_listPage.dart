import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("adoption")
          .where('recipient', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData?CircularProgressIndicator():ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final data = snapshot.data!.docs[index];
              final datas=data.data() as Map<String,dynamic>;
              return data["status"]=="accepted"?
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/chatpage",arguments: datas);
                },
                title: Text(data["senderName"]),):SizedBox();
            });
      },
    ));
  }
}
