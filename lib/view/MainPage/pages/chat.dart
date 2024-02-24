import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/controller/userController.dart';

import '../../../controller/messageController.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});
// final Map<String,dynamic>? data;
  @override
  Widget build(BuildContext context) {
    TextEditingController messagecontroller = TextEditingController();
    // final userController = Provider.of<UserController>(context);
    final msgController = Provider.of<MessageController>(context);
    // final petController = Provider.of<PetController>(context);
    final data = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final size = MediaQuery.of(context).size;
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
                        // petController.changeScreen(3);
                        Navigator.pushNamed(context, "/main");
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Text(
                    data["senderName"],
                    style: GoogleFonts.poppins(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        // Provider.of<FirebaseProvider>(context, listen: false)
                        //     .clearChat(service.auth.currentUser!.uid,
                        //     widget.user.uid!);
                      },
                      icon: const Icon(Icons.clear_all_outlined))
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
                    // child: Padding(
                    //   padding: const EdgeInsets.only(top: 30),
                    //   child: ChatBubble(service: service, size: size),
                    // ),
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
                                if (messagecontroller.text.isNotEmpty) {
                                  msgController.sendMessage(data["senderId"],
                                      messagecontroller.text);
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
