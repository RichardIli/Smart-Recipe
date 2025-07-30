import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Models/recipe.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesListState(recipes: []));

  void addRecipeToFavorites(Recipe recipe) {
    final currentState = state;
    if (currentState is FavoritesListState) {
      final updatedRecipes = List<Recipe>.from(currentState.recipes)
        ..add(recipe);
      emit(FavoritesListState(recipes: updatedRecipes));
    }
  }

  void removeRecipeToFavorites(Recipe recipe){
    final currentState = state;
    if (currentState is FavoritesListState) {
      final updatedRecipes = List<Recipe>.from(currentState.recipes)
        ..remove(recipe);
      emit(FavoritesListState(recipes: updatedRecipes));
    }
  }
}
