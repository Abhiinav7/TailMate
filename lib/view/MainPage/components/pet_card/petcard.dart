import 'package:flutter/material.dart';
import 'package:tailmate/Utils/constants/screen_utils.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil.Width(context);
    double screenHeight = ScreenUtil.Height(context);

    return GestureDetector(
      onTap: () {
        print(screenHeight);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo.shade300, width: 3),
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
              height: screenHeight / 5.06,
              margin: EdgeInsets.only(top: 6),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/pets/cat.jpg",
                      )),
                  // color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(15)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, top: 5),
              child: Text(
                "Nemo"
                ,
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
                      "Beagle",
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
                IconButton(
                    style: ButtonStyle(
                        iconColor:
                            MaterialStatePropertyAll(Colors.red.shade600),
                        iconSize: MaterialStatePropertyAll(30)),
                    onPressed: () {
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                       behavior: SnackBarBehavior.floating,
                         content: Text("H=${screenHeight} & W=${screenWidth}")));
                    },
                    icon: Icon(Icons.favorite_border)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
