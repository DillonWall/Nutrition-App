import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.text,
    required this.colors,
    required this.width,
    required this.height,
    required this.textStyle,
    this.borderRadius = const BorderRadius.all(Radius.circular(50)),
  });

  final String text;
  final double width;
  final double height;
  final TextStyle textStyle;
  final List<Color> colors;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
