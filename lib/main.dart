import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Themes/themes.dart';
import 'package:smart_recipe_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      onGenerateRoute: generateRoute,
      initialRoute: homeScreen,
    );
  }
}
