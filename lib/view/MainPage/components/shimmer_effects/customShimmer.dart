import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class MyShimmer extends StatelessWidget {
  const MyShimmer({super.key,
  required this.width,
  required this.height,
  this.radious=15,
  this.color,
  });
final double width;
final double height;
final double radious;
final Color? color;
  @override
  Widget build(BuildContext context) {
    return  Shimmer.fromColors(
period: Duration(milliseconds: 600),
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade400,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radious),
          color: color
        ),
      ),
    );
  }
}
