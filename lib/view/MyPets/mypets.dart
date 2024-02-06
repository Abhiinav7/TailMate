import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/controller/userController.dart';
class MyPets extends StatelessWidget {
  const MyPets({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Provider.of<UserController>(context);
    final petController=Provider.of<PetController>(context);
    final userId = FirebaseAuth.instance.currentUser!.uid;

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          style: ButtonStyle(
              iconSize: MaterialStatePropertyAll(29),
              iconColor: MaterialStatePropertyAll(Colors.teal)),
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            "My Pets.",
            style: GoogleFonts.aDLaMDisplay(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.teal),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pets").where("userId",isEqualTo:userId).snapshots(),
        builder:(context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final data=snapshot.data!.docs[index];
                  return Card(
                    
                    child: ListTile(
onTap: (){
  Navigator.pushNamed(context, "/petview",arguments: data.data());
},
                      title: Text(data["petName"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                      subtitle:Text( data["breed"],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
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
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(onPressed: (){
                         Navigator.pushNamed(context, "/updatepet",
                             arguments:
                             // {
                               // "age": data["age"],
                               // "petName": data["petName"],
                               // "breed": data["breed"],
                               // "gender": data["gender"],
                               // "imageUrl": data["imageUrl"],
                               // "weight": data["weight"],
                               // "discription": data["discription"],
                               // "petType": data["petType"],
                               // "time":data["time"]
                               data.data()

                             // }
                             );
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){
petController.myPetDelete(data["time"]);
                            }, icon: Icon(Icons.delete)),
                          ],
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
