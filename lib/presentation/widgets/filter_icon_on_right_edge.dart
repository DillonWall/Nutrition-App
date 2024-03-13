import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilterIconOnRightEdge extends StatelessWidget {
  final BuildContext context;
  final EdgeInsetsGeometry padding;

  const FilterIconOnRightEdge({
    super.key,
    required this.context,
    this.padding = const EdgeInsets.only(left: 8, right: 20),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        'assets/icons/Filter.svg',
        colorFilter: ColorFilter.mode(Theme.of(context).hintColor, BlendMode.srcIn),
      ),
    );
  }
}
