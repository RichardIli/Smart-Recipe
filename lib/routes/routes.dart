import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smart_recipe_app/Screens/FavoriteRecipesActionScreen/favorite_recipes_action_screen.dart';
import 'package:smart_recipe_app/Screens/FindRecipesActionScreen/find_recipes_action_screen.dart';
import 'package:smart_recipe_app/Screens/HomeScreen/home_screen.dart';
import 'package:smart_recipe_app/Screens/SearchedRecipeScreen/searched_recipe_screen.dart';

const String homeScreen = "homeScreen";

const String findRecipesActionScreen = "findRecipesActionScreen";

const String searchedRecipeScreen = "searchedRecipeScreen";

const String favoriteRecipeScreen = "favoriteRecipeScreen";

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return PageTransition(type: PageTransitionType.fade, child: HomeScreen());
    case findRecipesActionScreen:
      return PageTransition(
        type: PageTransitionType.fade,
        child: FindRecipesActionScreen(),
      );
    case searchedRecipeScreen:
      return PageTransition(
        type: PageTransitionType.fade,
        child: SearchedRecipeScreen(),
      );
    case favoriteRecipeScreen:
      return PageTransition(
        type: PageTransitionType.fade,
        child: FavoriteRecipeScreen(),
      );
    default:
      if (kDebugMode) {
        print("error in route");
      }
      return MaterialPageRoute(
        builder: (_) =>
            HomeScreen(), // You can replace this with any fallback screen
      );
  }
}
