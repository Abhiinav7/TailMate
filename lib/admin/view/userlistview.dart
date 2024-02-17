import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "User Details.",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.teal),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("user").snapshots(),
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data=snapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    onTap: (){
                    },
                    title: Text(data["name"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                    subtitle:Text( data["email"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                    leading: Container(
                      height: 56,
                      width: 56,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(56),
                        // child: CachedNetworkImage(
                        //     fit: BoxFit.cover,
                        //     imageUrl: data["imageUrl"]),
                      ),
                    ),
                  ),
                );
              },);
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
