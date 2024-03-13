import 'package:flutter/material.dart';

typedef HorizontalCarouselBoxColorCallback<T> = Color Function(
  BuildContext context,
  List<T> items,
  int index,
);
typedef HorizontalCarouselBoxChildrenCallback<T> = List<Widget> Function(
  BuildContext context,
  List<T> items,
  int index,
);

class HorizontalCarousel<T> extends StatelessWidget {
  final BuildContext context;
  final List<T> items;
  final double height;
  final double itemWidth;
  final double separationWidth;
  final HorizontalCarouselBoxColorCallback<T> boxColorCallback;
  final HorizontalCarouselBoxChildrenCallback<T> boxChildrenCallback;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry itemBorderRadius;

  const HorizontalCarousel({
    super.key,
    required this.context,
    required this.items,
    required this.height,
    required this.itemWidth,
    required this.separationWidth,
    required this.boxColorCallback,
    required this.boxChildrenCallback,
    this.padding = const EdgeInsets.only(left: 20, right: 20),
    this.itemBorderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        padding: padding,
        separatorBuilder: (context, index) => SizedBox(width: separationWidth),
        itemBuilder: (context, index) {
          return Container(
            width: itemWidth,
            height: height,
            decoration: BoxDecoration(
              color: boxColorCallback(context, items, index),
              borderRadius: itemBorderRadius,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: boxChildrenCallback(context, items, index),
            ),
          );
        },
      ),
    );
  }
}
