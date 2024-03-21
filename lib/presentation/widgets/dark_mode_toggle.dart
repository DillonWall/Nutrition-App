import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/config/theme/theme_collection.dart';
import 'package:nutrition_app/config/theme/theme_cubit.dart';

class DarkModeToggle extends StatelessWidget {
  final BuildContext context;

  const DarkModeToggle({
    super.key,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: context.read<ThemeCubit>().state == ThemeCollection.darkTheme,
      onChanged: (newValue) {
        context.read<ThemeCubit>().toggleTheme();
      },
    );
  }
}
