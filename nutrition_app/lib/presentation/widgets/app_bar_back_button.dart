import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarBackButton extends StatelessWidget {
  final BuildContext context;
  final EdgeInsetsGeometry margin;

  const AppBarBackButton({
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
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/icons/Arrow - Left 2.svg',
          colorFilter:
              ColorFilter.mode(Theme.of(context).colorScheme.onPrimaryContainer, BlendMode.srcIn),
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
