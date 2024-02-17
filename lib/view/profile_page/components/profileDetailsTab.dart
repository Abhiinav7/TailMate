import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailsTab extends StatelessWidget {
  ProfileDetailsTab({
    super.key,
    required this.name,
    required this.value,
    required this.onPressed,
  });

  String name;
  String value;
 void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              name,
              style: GoogleFonts.readexPro(
                  fontSize: 15, fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
            flex: 5,
            child: Text(
              value,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.readexPro(
                  fontSize: 17, fontWeight: FontWeight.w400),
            )),
        Expanded(
            child: IconButton(
                style: const ButtonStyle(iconSize: MaterialStatePropertyAll(15)),
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed:onPressed))
      ],
    );
  }
}
