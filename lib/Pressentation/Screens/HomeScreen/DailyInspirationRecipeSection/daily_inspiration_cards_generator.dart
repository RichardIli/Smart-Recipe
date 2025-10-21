import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Data/Models/recipe.dart';
import 'package:smart_recipe_app/Pressentation/SharedComponents/recipe_card.dart';

class DailyInspirationCardsGenerator extends StatelessWidget {
  const DailyInspirationCardsGenerator({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: List.generate(recipes.length, (index) {
          final recipe = recipes[index];
          return RecipeCard(index: index, recipe: recipe);
        }),
      ),
    );
  }
}
