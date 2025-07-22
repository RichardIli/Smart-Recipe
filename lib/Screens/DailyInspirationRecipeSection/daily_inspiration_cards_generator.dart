import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/Screens/DailyInspirationRecipeSection/daily_inspiration_card.dart';

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
        // make a bloc or cubit for fetching the data of this card
        // the bloc should fetch this "foodCategory","name", "preparationTime", "difficulty" and "process" from a repository
        // TODO: make the list dynamic that it will generate widget based on the length of the list
        // children: [
        //   DailyInspirationCard(
        //     foodCategory: "Pasta",
        //     foodName: "Spaghetti Carbonara",
        //     preparationTime: "Ready in 30 mins",
        //     process: "Cook pasta, prepare sauce, mix and serve.",
        //     difficulty: "Easy",
        //   ),
        // ],
        children: List.generate(recipes.length, (index) {
          final recipe = recipes[index];
          return DailyInspirationCard(recipe: recipe);
        }),
      ),
    );
  }
}
