import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/FavoritesCubit/favorites_cubit.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/Themes/themes.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesListState) {
          final favoriteRecipes = state.recipes;
          final isFavorite = favoriteRecipes.contains(recipe);
          return ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
            ),
            onPressed: () {
              if (isFavorite) {
                context.read<FavoritesCubit>().removeRecipeToFavorites(
                  recipe,
                );
              } else {
                context.read<FavoritesCubit>().addRecipeToFavorites(
                  recipe,
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
