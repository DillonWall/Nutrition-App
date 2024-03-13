import 'package:flutter/material.dart';
import 'package:nutrition_app/config/theme/theme_manager.dart';

class DarkModeToggle extends StatelessWidget {
  final BuildContext context;

  const DarkModeToggle({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    // return Switch(
    //   value: Provider.of<ThemeManager>(context).isDark,
    //   onChanged: (newValue) {
    //     Provider.of<ThemeManager>(context, listen: false).toggleTheme();
    //   },
    // );
    return Container();
    //TODO: fix theme manager
  }
}
