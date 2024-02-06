import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';
import 'package:tailmate/controller/petController.dart';
import 'package:tailmate/controller/userController.dart';
import 'package:tailmate/view/MainPage/components/shimmer_effects/customShimmer.dart';

class PetCard extends StatelessWidget {
   PetCard({
    super.key,
    required this.imageUrl,
    required this.breed,
    required this.petName,
     required this.data

  });
   String imageUrl;
   String breed;
   String petName;
  Map<String,dynamic> data;
  @override
  Widget build(BuildContext context) {

    final petController=Provider.of<PetController>(context);
    final userController=Provider.of<UserController>(context);
    double screenWidth = ScreenUtil.Width(context);
    double screenHeight = ScreenUtil.Height(context);

    return GestureDetector(
      onTap: () {
Navigator.pushNamed(context, "/petview",arguments: data);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.teal.shade400, width: 3),
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey.shade200,
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.indigo.withOpacity(0.3))
            ]),
        child: Column(
          children: [
            Container(
              width: screenWidth / 3.01,
              height: 142,
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                // color: Colors.grey.shade700,
                // image: DecorationImage(
                //   fit: BoxFit.fill,
                //     image: NetworkImage(data["imageUrl"])),
                //   borderRadius: BorderRadius.circular(18)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: CachedNetworkImage(
                  placeholder: (context, url) => MyShimmer(
                    height:142 ,width:screenWidth / 3.01 ,radious: 12,
                    color: Colors.grey,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  imageUrl:imageUrl),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, ),
              child: Text(
                petName,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: screenWidth / 78.4),
                    child: Text(
                      breed,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight:Radius.circular(13)
                    )
                  ),
                  child: IconButton(
                      style: ButtonStyle(
                          iconColor:
                          MaterialStatePropertyAll(Colors.white),
                          iconSize: MaterialStatePropertyAll(30)),
                      onPressed: () {
                          petController.addWishlist(data);

                      },
                      icon: Icon(Icons.favorite_border )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
