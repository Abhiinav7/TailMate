import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdoptController extends ChangeNotifier{
  CollectionReference adoption =
  FirebaseFirestore.instance.collection("adoption");
  // final currentUserId = FirebaseAuth.instance.currentUser!.uid;

  void sendRequest(String ownerId,String ownerName,BuildContext ctx,String senderName,String senderId,String petName) {
    var time=DateTime.now();
   adoption.doc(time.toString()).set({
     "petName":petName,
     "time":time.toString(),
      'senderId':senderId ,
     'senderName': senderName,
      'ownerId': ownerId,
     "ownerName":ownerName,
      'status': 'pending', // You can update this status as needed
      // Add any other relevant information about the request
    }).then((value)=>ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("Adoption Enquiry sent")))).catchError((error) {
      print("Failed to send request: $error");
    });
  }
  void acceptRequest(String time)async {
   await adoption.doc(time).update({
      'status': 'accepted',
    }).then((_) {
      print('Request accepted successfully');

      // You can perform any additional actions here after accepting the request
    }).catchError((error) {
      print('Failed to accept request: $error');
    });
  }
  void rejectRequest(String time)async {
   await adoption.doc(time).update({
      'status': 'rejected',
    }).then((_) {
      print('Request rejected successfully');
      // You can perform any additional actions here after rejecting the request
    }).catchError((error) {
      print('Failed to reject request: $error');
    });
  }



}