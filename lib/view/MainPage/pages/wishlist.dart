
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';

class WishlistPets extends StatelessWidget {
  const WishlistPets({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<PetController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "Wishlist.",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.indigo),
          ),
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
      child:  StreamBuilder(
        stream: controller.userCollection.doc(controller.userId).collection("wishlist").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];
                return ListTile(
                  title: Text(data["petName"]),
                  subtitle:Text( data["petBreed"]),
                  leading: Container(
                    height: 55,
                    width: 55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                          imageUrl: data["petImage"]),
                    ),
                  ),
                );
              },);
          }
          else{
            return Container();
          }
        },)
      ),
    );
  }
}
