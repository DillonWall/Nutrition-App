import 'package:flutter/material.dart';

class SmallHeadline extends StatelessWidget {
  final BuildContext context;
  final String text;
  final EdgeInsetsGeometry padding;

  const SmallHeadline({
    super.key,
    required this.context,
    required this.text,
    this.padding = const EdgeInsets.only(left: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
