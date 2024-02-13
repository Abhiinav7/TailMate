import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CurveContainer extends StatelessWidget {
   CurveContainer({super.key,
   required this.heading,
   required this.value,
   required this.unit,
   });
String heading;
String value;
String unit;
  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 60,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.teal.shade500,
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(heading,style: GoogleFonts.rem(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700),),
              Text(value+unit,style: GoogleFonts.readexPro(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500)),

            ],
          ),
          Positioned(
              left: -3,
              bottom: 2,
              child: Transform.rotate(
                  angle: 15 * 15 / 180,
                  child: Image.asset(
                    "assets/images/paw.png",
                    height: 20,
                    width: 30,
                    color: Colors.teal.shade200,
                  ))),
          Positioned(
              top: 2,
              right: -4,
              child: Transform.rotate(
                  angle: 15 * 50 / 180,
                  child: Image.asset(
                    "assets/images/paw.png",
                    height: 20,
                    width: 30,
                    color: Colors.teal.shade200,
                  )))
        ],
      ),
    );
  }
}
