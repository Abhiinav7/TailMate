import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/controller/mainController.dart';
import 'package:tailmate/view/categories_view/categories.dart';

import '../../../Utils/constants/screen_utils.dart';
class VerticalCategory extends StatelessWidget {
  const VerticalCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // double screenHight = ScreenUtil.Height(context);
    double screenWidth = ScreenUtil.Width(context);
    final controller=Provider.of<MainController>(context);
    return SizedBox(
      height: screenWidth / 2.8,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              GestureDetector(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => PetCategory(pet:controller.petCategories[index]

                            ,),));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
                        height: screenWidth / 5.14,
                        width: screenWidth / 5.14,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: AssetImage(
                                controller.petImages[index],
                              ))
                        ),
                        // child: CircleAvatar(
                        //   backgroundImage: AssetImage(
                        //   controller.petImages[index],
                        //   ),
                        // ),
                      ),
                    ),
                    Text(controller.petCategories[index],style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 17
                    ),)
                  ],
                ),
              )
      ),
    );
  }
}