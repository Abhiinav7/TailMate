import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../model/messageModel.dart';

class MessageController extends ChangeNotifier {
  deleteMesagges(String chatroomid) async {
    try{
      await firestore.collection("chat").doc(chatroomid).delete();
    }
    catch(e){
      print("error:${e}");
    }
  }

  CollectionReference adoption =
      FirebaseFirestore.instance.collection("adoption");

  deleteUser(var time) async {
    await adoption.doc(time).delete();
  }
  deleteUserAndChat(String chatroomid,var time,BuildContext context)async{
    try{
      await firestore.collection("chat").doc(chatroomid).delete().
      then((value) => deleteUser(time)).then((value) => Navigator.pushNamed(context, "/chatlist"));
    }
    catch(e){
      print("error:${e}");
    }
  }


  TextEditingController messagecontroller = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference firebaseStorage = FirebaseStorage.instance.ref();
  String downloadurl = "";

  sendMessage(String recieverId, String recieverName, String message,
      String senterId, String senterName) async {
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
