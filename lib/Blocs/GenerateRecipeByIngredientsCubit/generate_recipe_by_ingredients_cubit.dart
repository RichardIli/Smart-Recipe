import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/Repositories/recipe_generator_repository.dart';

part 'generate_recipe_by_ingredients_state.dart';

class GenerateRecipeByIngredientsCubit
    extends Cubit<GenerateRecipeByIngredientsState> {
  final RecipeGeneratorRepository recipeGeneratorRepository;
  GenerateRecipeByIngredientsCubit(this.recipeGeneratorRepository)
    : super(GenerateRecipeByIngredientsInitial());

  Future<void> generateRecipes(
    List<String> ingredients,
    String? category,
  ) async {
    emit(GenerateRecipeByIngredientsLoading());

    try {
      // Here you would typically fetch recipes based on the ingredients and category
      List<Recipe> recipes = await recipeGeneratorRepository.generateRecipe(
        ingredients: ingredients.join(', '),
        category: category,
      );
      emit(GenerateRecipeByIngredientsSuccess(recipes));
    } catch (e) {
      emit(GenerateRecipeByIngredientsFailure(e.toString()));
    }
  }
}
