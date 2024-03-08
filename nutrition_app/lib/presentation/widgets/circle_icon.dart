import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleIcon extends StatelessWidget {
  final String iconPath;
  final double width;
  final double height;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const CircleIcon({
    super.key,
    required this.iconPath,
    required this.width,
    required this.height,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: padding,
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
