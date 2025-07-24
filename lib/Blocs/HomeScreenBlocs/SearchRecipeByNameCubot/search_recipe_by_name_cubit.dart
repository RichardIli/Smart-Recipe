import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/Repositories/recipe_generator_repository.dart';

part 'search_recipe_by_name_state.dart';

class SearchRecipeByNameCubit extends Cubit<SearchRecipeByNameState> {
  final RecipeGeneratorRepository recipeGeneratorRepository;
  SearchRecipeByNameCubit(this.recipeGeneratorRepository)
    : super(SearchRecipeByNameInitial());

  void searchRecipeByName(String recipeName) async {
    emit(SearchRecipeByNameLoading(recipeName));
    try {
      await recipeGeneratorRepository
          .generateRecipeByName(recipeName: recipeName)
          .then((recipes) {
            if (recipes.isEmpty) {
              emit(
                SearchRecipeByNameFailure(
                  recipeName,
                  "No recipes found for '$recipeName'",
                ),
              );
            } else {
              emit(SearchRecipeByNameSuccess(recipeName, recipes));
            }
          });
    } catch (error) {
      emit(SearchRecipeByNameFailure(recipeName, error.toString()));
    }
  }
}
