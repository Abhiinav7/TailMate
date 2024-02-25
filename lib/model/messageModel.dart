import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? message;
  String? senderId;
  String? senderName;
  String? recieverId;
  String? recieverName;
  Timestamp? time;
  Message(
      {
        required this.recieverName,
        required this.message,
        required this.recieverId,
        required this.senderId,
        required this.time,
        required this.senderName});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      recieverName: json["recieverName"],
         message: json["message"],
        senderName: json["senderName"],
        recieverId: json["recieverId"],
        senderId: json["senderId"],
        time: json["time"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "recieverName":recieverName,
      "message":message,
      'senderName': senderName,
      "recieverId": recieverId,
      "senderId": senderId,
      "time": time
    };
  }
}