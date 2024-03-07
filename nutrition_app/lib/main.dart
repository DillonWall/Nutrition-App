import 'package:flutter/material.dart';
import 'package:nutrition_app/config/theme/theme_collection.dart';
import 'package:nutrition_app/config/theme/theme_manager.dart';
import 'package:nutrition_app/presentation/pages/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: ThemeManager()),
        StreamProvider<ThemeData>(
          create: (context) => Provider.of<ThemeManager>(context, listen: false).theme,
          initialData: ThemeCollection.lightTheme,
        )
      ],
      child: Consumer<ThemeData>(
        builder: (context, theme, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomePage(),
        ),
      ),
    );
  }
}
