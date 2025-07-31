import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Models/recipe.dart';

class RecipeDetailsWindow extends StatelessWidget {
  const RecipeDetailsWindow({
    super.key,
    required this.recipe,
    required this.index,
  });

  final Recipe recipe;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(recipe.foodName),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              recipe.foodCategory,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              recipe.preparationTime,
              style: TextStyle(color: Colors.grey[600]),
            ),
            Text(recipe.difficulty),
            Text("Ingredients", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(recipe.ingredients.join('\n')),
            Text("Instruction", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(recipe.process),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
      ],
    );
  }
}
