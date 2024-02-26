import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../model/messageModel.dart';

class MessageController extends ChangeNotifier{


  TextEditingController messagecontroller = TextEditingController();


  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference firebaseStorage = FirebaseStorage.instance.ref();
  String downloadurl = "";

  sendMessage(String recieverId, String recieverName,String message,String senterId,String senterName) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    // final String currentuseremail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Message newmessage = Message(
      message: message,
        recieverId: recieverId,
        recieverName: recieverName,
        senderId: currentUserId,
        senderName: senterName,
        time: timestamp,
    );

    List ids = [senterId, recieverId];
    ids.sort();
    String chatroomid = ids.join("_");
    await firestore
        .collection("chat")
        .doc(chatroomid)
        .collection("messages")
        .add(newmessage.toJson());
  }

}