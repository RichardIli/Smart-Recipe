import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/FavoritesCubit/favorites_cubit.dart';
import 'package:smart_recipe_app/Models/recipe.dart';

class RecipeListViewBuilder extends StatelessWidget {
  const RecipeListViewBuilder({super.key, required this.recipes});

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          // TODO: make this tile popup in the design because its flat
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Material(
              borderRadius: BorderRadius.circular(16.0),
              elevation: 5,
              child: ListTile(
                // tileColor: kSecondaryColor.withValues(alpha: .2),
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
                      return AlertDialog(
                        title: Stack(
                          children: [
                            Text(recipes[index].foodName),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(Icons.close_rounded),
                              ),
                            ),
                          ],
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            spacing: 10,
                            children: [
                              Text(
                                recipes[index].foodCategory,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                recipes[index].preparationTime,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text(recipes[index].difficulty),
                              Text(recipes[index].ingredients.join(', ')),
                              Text(recipes[index].process),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                trailing: FavoriteButton(recipes: recipes, index: index),
              ),
            ),
          );
        },
      ),
    );
  }
}

// TODO: Test this tomorow
class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.recipes, required this.index});

  final List<Recipe> recipes;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesListState) {
          final favoriteRecipes = state.recipes;
          final isFavorite = favoriteRecipes.contains(recipes[index]);
          return ElevatedButton.icon(
            onPressed: () {
              if (isFavorite) {
                context.read<FavoritesCubit>().addRecipeToFavorites(
                  recipes[index],
                );
              } else {
                context.read<FavoritesCubit>().removeRecipeToFavorites(
                  recipes[index],
                );
              }
            },
            label: Icon(
              isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              color: Colors.red[400],
            ),
          );
        }
        return Container();
      },
    );
  }
}
