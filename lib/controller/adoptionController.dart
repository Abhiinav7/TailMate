import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdoptController extends ChangeNotifier{
  CollectionReference adoption =
  FirebaseFirestore.instance.collection("adoption");
  // final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  void sendRequest({required String ownerId,required String ownerName,required BuildContext ctx,required String senderName,required String senderId,required String petName,required String senderPhone,required String ownerPhone}) {
    var time=DateTime.now();
   adoption.doc(time.toString()).set({
     "petName":petName,
     "time":time.toString(),
      'senderId':senderId ,
     "senderPhone":senderPhone,
     'senderName': senderName,
      'ownerId': ownerId,
     "ownerName":ownerName,
     "ownerPhone":ownerPhone,
      'status': 'pending',

    }).then((value)=>ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("Adoption Enquiry sent")))).catchError((error) {
      print("Failed to send request: $error");
    });
  }
  deleteRequest(var time)async{
    await adoption.doc(time).delete();
  }
  void acceptRequest(String time)async {
   await adoption.doc(time).update({
      'status': 'accepted',
    }).then((_) {
     print('Request accepted successfully');

   }).catchError((error) {
      print('Failed to accept request: $error');
    });
  }
  void rejectRequest(String time)async {
   await adoption.doc(time).update({
      'status': 'rejected',
    }).then((value) => deleteRequest(time)).catchError((error) {
      print('Failed to reject request: $error');
    });
  }



}