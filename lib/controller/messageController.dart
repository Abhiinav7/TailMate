import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../model/messageModel.dart';

class MessageController extends ChangeNotifier {
 Future<void> clearChat(String chatroomid,BuildContext context) async {
    final QuerySnapshot snapshot = await firestore.collection("chat").doc(chatroomid).collection("messages").get();
    final List<Future<void>> futures = [];
    for (final DocumentSnapshot doc in snapshot.docs) {
      futures.add(doc.reference.delete());
    }
    await Future.wait(futures);
  }

  CollectionReference adoption =
      FirebaseFirestore.instance.collection("adoption");

  deleteUser(var time,BuildContext context) async {
    await adoption.doc(time).delete().then((value) => Navigator.pushReplacementNamed(context, "/chatlist"));
  }



  TextEditingController messagecontroller = TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Reference firebaseStorage = FirebaseStorage.instance.ref();

  sendMessage(String recieverId, String recieverName, String message,
      String senterId, String senterName) async {
    final String currentUserId = firebaseAuth.currentUser!.uid;
    // final String currentuseremail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();
    Message newmessage = Message(
      message: message,
      // recieverId: recieverId,
      // recieverName: recieverName,
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
