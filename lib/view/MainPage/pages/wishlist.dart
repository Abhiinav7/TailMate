
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
                final data = snapshot.data!.docs[index] ;


                return Card(
                  child: ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, "/petview",arguments: data.data());
                    },
                    title: Text(data["petName"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                    subtitle:Text( data["petBreed"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                    leading: Container(
                      height: 56,
                      width: 56,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(56),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                            imageUrl: data["petImage"]),
                      ),
                    ),
                    trailing: IconButton(onPressed: (){
                      controller.deleteWishlist(data["time"]);
                    }, icon: Icon(Icons.delete)),
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
