import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_recipe_app/Screens/home_screen.dart';

const String homeScreen = "homeScreen";

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return PageTransition(type: PageTransitionType.fade, child: HomeScreen());
    default:
      // ignore: avoid_print
      print("error in route");
      return MaterialPageRoute(
        builder: (_) =>
            HomeScreen(), // You can replace this with any fallback screen
      );
  }
}
