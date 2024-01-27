import 'package:flutter/material.dart';
class VerticalCategory extends StatelessWidget {
  const VerticalCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.red,
                        borderRadius: BorderRadius.circular(35),
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/pets/dog.jpg"
                      ),
                    ),
                  ),
                  Text("Dog",style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 17
                  ),)
                ],
              )
      ),
    );
  }
}