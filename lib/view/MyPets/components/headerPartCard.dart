import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/view/MainPage/components/containers/primary_header.dart';
import 'package:tailmate/view/MainPage/widgets/customAppbar.dart';
class HeaderPart extends StatelessWidget {
  const HeaderPart({
    super.key,
    required this.screenWidth,
    required this.data,
    required this.petController,
  });

  final double screenWidth;
  final Map data;
  final PetController petController;

  @override
  Widget build(BuildContext context) {
    return PrimaryHeaderContainer(
      height: 350,
      screenWidth: screenWidth,
      child: Stack(
        children: [
          Container(
              width: screenWidth,
              height: 350,
              child: CachedNetworkImage(
                  fit: BoxFit.fill, imageUrl: data["imageUrl"])),
          MyAppbar(
            leading: IconButton(
              style: ButtonStyle(
                  iconSize: MaterialStatePropertyAll(29),
                  iconColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.transparent,
          ),


        ],
      ),
    );
  }
}