import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/view/MainPage/components/pet_card/petcard.dart';

class PetCategory extends StatelessWidget {
  const PetCategory({super.key,required this.pet});
final String pet;
  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.Width(context);
    return Scaffold(
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
title: Text(
  pet,
  style: GoogleFonts.aDLaMDisplay(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.teal),
)
        ),
        body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("pets").where(
        "petType", isEqualTo: pet).snapshots(),
         builder: (context, snapshot) {
if(snapshot.hasData){
    return GridView.builder(
    padding: EdgeInsets.all(screenWidth / 26.13),
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    itemCount: snapshot.data!.docs.length,
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisExtent: 222,
    crossAxisSpacing: screenWidth / 32.66,
    mainAxisSpacing: screenWidth / 32.66,
    ),
    itemBuilder: (context, index) {
    final data = snapshot.data!.docs[index];
    return PetCard(
    data: data.data(),
    imageUrl: data["imageUrl"],
    breed: data["breed"],
    petName: data["petName"],

    );
    });
    }



    else{
    return Container();
    }
  }
  )
  );
}}
