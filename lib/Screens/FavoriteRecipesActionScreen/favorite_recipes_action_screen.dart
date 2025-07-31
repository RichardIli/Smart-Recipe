import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/FavoritesCubit/favorites_cubit.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_list_view_builder.dart';

class FavoriteRecipeScreen extends StatelessWidget {
  const FavoriteRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Favorites Recipe")),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state is FavoritesListState) {
                final List<Recipe> recipes = state.recipes;
                if (recipes.isEmpty) {
                  return Center(child: Text("No favorite recipes found."));
                }
                return RecipeListViewBuilder(recipes: recipes);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
