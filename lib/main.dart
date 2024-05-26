import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/config/theme/theme_cubit.dart';
import 'package:nutrition_app/injection_container.dart';
import 'package:nutrition_app/presentation/pages/home.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(
    MultiBlocProvider(
      providers: blocProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, theme) {
        return MaterialApp(
          title: "Nutrition App",
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomePage(),
        );
      },
    );
  }
}
