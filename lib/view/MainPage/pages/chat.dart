import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controller/messageController.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
// final Map<String,dynamic>? data;
  @override
  Widget build(BuildContext context) {
    TextEditingController messagecontroller = TextEditingController();
    ScrollController scrollController = ScrollController();
    void scrollToBottom() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    }
    final msgController = Provider.of<MessageController>(context);
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final size = MediaQuery.of(context).size;
    var uid = FirebaseAuth.instance.currentUser!.uid;
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromRGBO(41, 15, 102, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/main");
                      },
                      icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
                  Text(
                    data["ownerName"],
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        // Provider.of<FirebaseProvider>(context, listen: false)
                        //     .clearChat(service.auth.currentUser!.uid,
                        //     widget.user.uid!);
                      },
                      icon: const Icon(Icons.clear_all_outlined,color: Colors.white,))
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    // messages container
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(239, 237, 247, 1),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(35))),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("chat_room")
                          .doc("${data["ownerId"]}_${data["senderId"]}")
                          .collection("messages")
                          .orderBy("time", descending: false)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            controller: scrollController,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final messages = snapshot.data!.docs[index];
                              return Column(
                                crossAxisAlignment: messages["senderId"] == uid
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      constraints: BoxConstraints(
                                          maxHeight: height, maxWidth: width-120),
                                      decoration:BoxDecoration(
                                          color: messages["senderId"] == uid ? Colors.black : Colors.teal,
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      margin: EdgeInsets.all(15),
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        messages["message"],
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white,fontWeight: FontWeight.w400),
                                      )),
                                ],
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Text("no messages found"),
                          );
                        }
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 5,
                    right: 5,
                    child: Container(
                      // chating field
                      width: size.width * 0.9,
                      height: size.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                // showDialog(
                                //   context: context,
                                //   builder: (context) {
                                //     // final pro =
                                //     // Provider.of<BasicProvider>(context);
                                //     // return ImageSelectorDialog(
                                //     //   pro: pro,
                                //     //   size: size,
                                //     //   recieverId: widget.user.uid!,
                                //     // );
                                //   },
                                // );
                              },
                              icon: Image.asset(
                                'assets/images/paw.png',
                                height: 30,
                              )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                style: GoogleFonts.poppins(
                                    color: Colors.black, fontSize: 18),
                                controller: messagecontroller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    filled: true,
                                    fillColor:
                                        const Color.fromRGBO(239, 237, 247, 1)),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                print(uid);
                                if (messagecontroller.text.isNotEmpty) {
                                  msgController.sendMessage(
                                      data["ownerId"],
                                      data["ownerName"],
                                      messagecontroller.text,
                                      data["senderId"],
                                      data["senderName"]);
                                  scrollToBottom();
                                  messagecontroller.clear();

                                }
                              },
                              icon: const Icon(
                                Icons.send_rounded,
                                color: Colors.amber,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
