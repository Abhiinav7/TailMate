import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tailmate/controller/userController.dart';
import '../../../controller/messageController.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key});

  @override
  Widget build(BuildContext context) {

    final data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    List ids = [data["senderId"],data["ownerId"]];
    ids.sort();
    String chatroomid = ids.join("_");
    final size = MediaQuery.of(context).size;
    ScrollController scrollController = ScrollController();
    void scrollToBottom() {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
    return Consumer2<MessageController,UserController>(
      builder: (context, value,userController, child) =>Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromRGBO(239, 237, 247, 1),
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(19),bottomRight:  Radius.circular(19))),
          leading:IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, "/main");
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          backgroundColor: Color.fromRGBO(41, 15, 102, 1),
          title: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              data['ownerId'] == userController.uid ? data["senderName"] : data['ownerName'],
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
                 PopupMenuButton(
                   icon: Icon(Icons.clear_all_outlined,color: Colors.white,),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    itemBuilder: (context) {
                      return [
                        PopupMenuItem(
                            child: TextButton(
                                onPressed: () {
                                  value.deleteUser(data["time"],context);
                                  // Navigator.pop(context);
                                },
                                child: Text("Delete user"))),
                        PopupMenuItem(
                            child: TextButton(
                                onPressed: () {
                                  showDialog(
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      scrollable: true,
                                      title: Text("Delete"),
                                      content: Text("Are you sure !"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("cancel")),
                                        ElevatedButton(
                                            onPressed: () {
value.clearChat(chatroomid,context);
                                              Navigator.pop(context);
                                            },
                                            child: Text("Yes")),
                                      ],
                                    ),
                                  );
                                },
                                child: Text("Clear chat"))),
                      ];
                    })

          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                // messages container
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(239, 237, 247, 1),
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("chat")
                      .doc(chatroomid)
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
                            crossAxisAlignment: messages["senderId"] == userController.uid
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                constraints: BoxConstraints(maxHeight: size.height
                                    , maxWidth: size.width - 120),
                                decoration: BoxDecoration(
                                  color: messages["senderId"] == userController.uid ? Colors.black : Colors.teal,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin: EdgeInsets.all(15),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  messages["message"],
                                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
                                ),
                              ),

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
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5,vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
                color: Color.fromRGBO(41, 15, 102, 1),),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/paw.png',
                      height: 30,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        style: TextStyle(color: Colors.black, fontSize: 18),
                        controller:value.messagecontroller,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(20)),
                          filled: true,
                          fillColor: const Color.fromRGBO(239, 237, 247, 1),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (value.messagecontroller.text.isNotEmpty) {
                        value.sendMessage(
                          data["ownerId"],
                          data["ownerName"],
                          value.messagecontroller.text,
                          data["senderId"],
                          data["senderName"],
                        );
                        value.messagecontroller.clear();
                        scrollToBottom();
                      }
                    },
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.amber,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ) ,

    );
  }
}
