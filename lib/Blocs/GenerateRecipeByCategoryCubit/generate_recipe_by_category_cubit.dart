import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/Repositories/recipe_generator_repository.dart';

part 'generate_recipe_by_category_state.dart';

class GenerateRecipeByCategoryCubit
    extends Cubit<GenerateRecipeByCategoryState> {
  final RecipeGeneratorRepository recipeGeneratorRepository;
  GenerateRecipeByCategoryCubit(this.recipeGeneratorRepository)
    : super(GenerateRecipeByCategoryInitial());

  void generateRecipeByCategory(String category) async {
    emit(GenerateRecipeByCategoryLoading());
    try {
      emit(GenerateRecipeByCategoryLoading());
      await recipeGeneratorRepository
          .generateRecipeByCategory(foodCategory: category)
          .then((recipes) {
            if (recipes.isEmpty) {
              emit(
                GenerateRecipeByCategoryFailure(
                  "No recipes found for category '$category'",
                ),
              );
            } else {
              emit(GenerateRecipeByCategorySuccess(recipes));
            }
          });
    } catch (error) {
      // emit(GenerateRecipeByCategoryFailure(error.toString()));
      emit(GenerateRecipeByCategoryFailure("Failed to generate recipes"));
    }
  }
}
