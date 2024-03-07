import 'package:flutter/material.dart';
import 'package:nutrition_app/config/theme/theme_manager.dart';
import 'package:provider/provider.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<ThemeManager>(context).isDark,
      onChanged: (newValue) {
        Provider.of<ThemeManager>(context, listen: false).toggleTheme();
      },
    );
  }
}
