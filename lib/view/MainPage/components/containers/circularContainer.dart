import 'package:flutter/cupertino.dart';

class CirculaContainer extends StatelessWidget {
  CirculaContainer({
    super.key,
    this.height=300,
    this.width=300,
    this.padding=0,
    this.child,
    this.bg,
    this.radius=300

  });
  final double? height;
  final double? width;
  final double radius;
  final double padding;
  final Widget? child;
  final Color? bg;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: bg
      ),
      child: child,
    );
  }
}
