import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/SharedComponents/favorite_button.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_details_window.dart';

class RecipeListViewBuilder extends StatelessWidget {
  const RecipeListViewBuilder({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Material(
            borderRadius: BorderRadius.circular(16.0),
            elevation: 5,
            child: ListTile(
              // tileColor: kSecondaryColor.withValues(alpha: .2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              title: Text(recipes[index].foodCategory),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10.0,
                children: [
                  Text(
                    recipes[index].foodName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    recipes[index].preparationTime,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(recipes[index].difficulty),
                ],
              ),
              // leading: CircleAvatar(
              //   backgroundImage: NetworkImage(recipes[index].imageUrl),
              // ),
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) {
                    return RecipeDetailsWindow(
                      recipe: recipes[index],
                      index: index,
                    );
                  },
                );
              },
              trailing: FavoriteButton(recipe: recipes[index]),
            ),
          ),
        );
      },
    );
  }
}
