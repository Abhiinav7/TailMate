import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/view/MyPets/components/headerPartCard.dart';
import 'package:tailmate/view/MyPets/components/reusableContainer.dart';

class PetCardView extends StatelessWidget {
  PetCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;

    final petController = Provider.of<PetController>(context);
    double screenWidth = ScreenUtil.Width(context);
    return Scaffold(
        body: Column(
      children: [
        HeaderPart(
            screenWidth: screenWidth, data: data, petController: petController),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 3, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data["petName"],
                style: GoogleFonts.gabriela(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              IconButton(
                  style: ButtonStyle(
                      iconSize: MaterialStatePropertyAll(30),
                      iconColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    petController.addWishlist(
                        data["petName"], data["breed"], data["imageUrl"]);
                  },
                  icon: Icon(Icons.favorite_border))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              data["breed"],
              style: GoogleFonts.alike(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.8)),
            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CurveContainer(
              heading: 'Age',
              value: data["age"].toString(),
            ),
            CurveContainer(heading: "Gender", value: data["gender"]),
            CurveContainer(heading: "Weight", value: data["weight"].toString()),
          ],
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Text(
                "About ${data["petName"]}",
                style:
                    GoogleFonts.aleo(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data["discription"],
                style: TextStyle(
                  fontSize: 15,
                ),
              )),
        )
      ],
    ),

    floatingActionButton: Container(
      height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(12)
        ),
        child: TextButton(
            onPressed: (){}, child: Text("Adopt Me!",style: TextStyle(
          color: Colors.white,
          fontSize: 15
        ),))),
    );
  }
}
