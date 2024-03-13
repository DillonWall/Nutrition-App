import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchIcon extends StatelessWidget {
  final BuildContext context;
  final EdgeInsetsGeometry padding;

  const SearchIcon({
    super.key,
    required this.context,
    this.padding = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SvgPicture.asset(
        'assets/icons/Search.svg',
        colorFilter: ColorFilter.mode(Theme.of(context).hintColor, BlendMode.srcIn),
      ),
    );
  }
}
