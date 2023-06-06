import 'package:flutter/material.dart';

class KryptoCard extends StatelessWidget {
  final Color cardColour;
  final Color cardShadowColour;
  final List<double> coordinatesCircularRadiusTopLeftToBottomRight;
  final double cardShadowRadius;
  final double cardShadowBlurPoints;
  final Widget cardChild;

  KryptoCard({
    this.cardColour = const Color(0xFF123456),
    this.cardShadowColour = const Color(0xFF123456),
    @required this.cardChild,
    this.coordinatesCircularRadiusTopLeftToBottomRight = const [0.0, 0.0, 0.0, 0.0],
    this.cardShadowRadius = 10.0,
    this.cardShadowBlurPoints = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: cardColour,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(coordinatesCircularRadiusTopLeftToBottomRight[0]),
            topRight: Radius.circular(coordinatesCircularRadiusTopLeftToBottomRight[1]),
            bottomLeft: Radius.circular(coordinatesCircularRadiusTopLeftToBottomRight[2]),
            bottomRight: Radius.circular(coordinatesCircularRadiusTopLeftToBottomRight[3])),
        boxShadow: [
          BoxShadow(
            color: cardShadowColour,
            spreadRadius: cardShadowRadius,
            blurRadius: cardShadowBlurPoints,
          ),
        ],
      ),
      child: Center(
        child: cardChild,
      ),
    );
  }
}
