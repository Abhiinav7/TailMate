import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? message;
  String? senderId;
  String? senderemail;
  String? recieverId;
  Timestamp? time;
  Message(
      {
        required this.message,
        required this.recieverId,
        required this.senderId,
        required this.time,
        required this.senderemail});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
         message: json["message"],
        senderemail: json["senderemail"],
        recieverId: json["recieverId"],
        senderId: json["senderId"],
        time: json["time"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "message":message,
      'senderemail': senderemail,
      "recieverId": recieverId,
      "senderId": senderId,
      "time": time
    };
  }
}