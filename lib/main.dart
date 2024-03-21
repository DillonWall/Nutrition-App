import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/config/theme/theme_cubit.dart';
import 'package:nutrition_app/injection_container.dart';
import 'package:nutrition_app/presentation/bloc/categories/remote/remote_categories_bloc.dart';
import 'package:nutrition_app/presentation/bloc/random_recipes/remote/remote_random_recipes_bloc.dart';
import 'package:nutrition_app/presentation/pages/home.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<RemoteCategoriesBloc>(
          create: (context) => sl()..add(const GetCategories()),
        ),
        BlocProvider<RemoteRandomRecipesBloc>(
          create: (context) => sl()..add(const GetRandomRecipes(10)),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => sl(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
