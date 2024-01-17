import 'package:flutter/material.dart';
import 'package:tailmate/view/MainPage/components/containers/circularContainer.dart';
import 'package:tailmate/view/MainPage/components/curved_edges/curvedWidget.dart';
class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({

    required this.screenWidth,
    required this.child
  });

  final double screenWidth;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CurvedWidget(
      child: Container(
        width: screenWidth,
        color: Colors.indigo.shade600,
        padding: EdgeInsets.all(0),
        child: SizedBox(
          height: 300,
          child: Stack(
              children: [
                Positioned(
                    top: -120,
                    right: -200,
                    child: CirculaContainer(
                      bg: Colors.white.withOpacity(0.1),
                    )),
                Positioned(
                    top: 110,
                    right: -190,
                    child: CirculaContainer(
                      bg: Colors.white.withOpacity(0.2),
                    )),
                child

              ]),
        ),
      ),
    );
  }
}
