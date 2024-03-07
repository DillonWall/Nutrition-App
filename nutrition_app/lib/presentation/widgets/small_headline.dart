import 'package:flutter/material.dart';

class SmallHeadline extends StatelessWidget {
  const SmallHeadline({
    super.key,
    required this.context,
    required this.text,
    this.padding = const EdgeInsets.only(left: 20),
  });

  final BuildContext context;
  final String text;
  final EdgeInsetsGeometry padding;

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
