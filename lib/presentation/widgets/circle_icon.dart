import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nutrition_app/core/constants/constants.dart';

class CircleIcon extends StatelessWidget {
  final String? iconUrl;
  final double width;
  final double height;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;

  const CircleIcon({
    super.key,
    required this.iconUrl,
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
        child: CachedNetworkImage(
          imageUrl: iconUrl ?? placeholderURL,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
