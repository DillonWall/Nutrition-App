import 'package:flutter/material.dart';

typedef VerticalCarouselBoxColorCallback<T> = Color Function(
  BuildContext context,
  List<T> items,
  int index,
);
typedef VerticalCarouselBoxChildrenCallback<T> = List<Widget> Function(
  BuildContext context,
  List<T> items,
  int index,
);
typedef VerticalCarouselBoxShadowCallback<T> = List<BoxShadow>? Function(
  BuildContext context,
  List<T> items,
  int index,
);

class VerticalCarousel<T> extends StatelessWidget {
  final BuildContext context;
  final List<T> items;
  final double itemHeight;
  final double separationHeight;
  final VerticalCarouselBoxColorCallback<T> boxColorCallback;
  final VerticalCarouselBoxChildrenCallback<T> boxChildrenCallback;
  final VerticalCarouselBoxShadowCallback<T> boxShadowCallback;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry itemBorderRadius;
  final bool shrinkWrap;

  const VerticalCarousel({
    super.key,
    required this.context,
    required this.items,
    required this.itemHeight,
    required this.separationHeight,
    required this.boxColorCallback,
    required this.boxChildrenCallback,
    required this.boxShadowCallback,
    this.padding = const EdgeInsets.only(left: 20, right: 20),
    this.itemBorderRadius = const BorderRadius.all(Radius.circular(16)),
    this.shrinkWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      scrollDirection: Axis.vertical,
      padding: padding,
      shrinkWrap: shrinkWrap,
      separatorBuilder: (context, index) => SizedBox(width: separationHeight),
      itemBuilder: (context, index) {
        return Container(
          width: itemHeight,
          decoration: BoxDecoration(
            color: boxColorCallback(context, items, index),
            borderRadius: itemBorderRadius,
            boxShadow: boxShadowCallback(context, items, index),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: boxChildrenCallback(context, items, index),
          ),
        );
      },
    );
  }
}
