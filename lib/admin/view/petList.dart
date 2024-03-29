import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';

class AllPets extends StatelessWidget {
  const AllPets({super.key});

  @override
  Widget build(BuildContext context) {
    final petController=Provider.of<PetController>(context);


    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "User Pets",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.indigo),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pets").snapshots(),
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data=snapshot.data!.docs[index];
                return Card(
color: Colors.indigo.shade50,
                  child: ListTile(
                    onTap: (){
                      Navigator.pushNamed(context, "/petview",arguments: data.data());
                    },
                    title: Text(data["petName"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    subtitle:Text( data["breed"],style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                    leading: Container(
                      height: 56,
                      width: 56,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(56),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: data["imageUrl"]),
                      ),
                    ),
                    trailing: IconButton(onPressed: (){
                      petController.myPetDelete(data["time"]);
                    }, icon: Icon(Icons.delete)),
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
