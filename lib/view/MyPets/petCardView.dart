import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/view/MyPets/components/headerPartCard.dart';


class PetCardView extends StatelessWidget {
  PetCardView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    final petController=Provider.of<PetController>(context);
    double screenWidth = ScreenUtil.Width(context);
    return Scaffold(
        body: Column(
      children: [
        HeaderPart(screenWidth: screenWidth, data: data, petController: petController)
      ],
    ));
  }
}


