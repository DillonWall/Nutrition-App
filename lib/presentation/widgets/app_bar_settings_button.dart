import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarSettingsButton extends StatelessWidget {
  final BuildContext context;
  final EdgeInsetsGeometry margin;

  const AppBarSettingsButton({
    super.key,
    required this.context,
    this.margin = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: margin,
        alignment: Alignment.center,
        width: 37,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/icons/dots.svg',
          colorFilter:
              ColorFilter.mode(Theme.of(context).colorScheme.onPrimaryContainer, BlendMode.srcIn),
          width: 5,
          height: 5,
        ),
      ),
    );
  }
}
