import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/Repositories/recipe_generator_repository.dart';
part 'generate_daily_recipe_state.dart';

class GenerateDailyRecipeCubit extends Cubit<GenerateDailyRecipeState> {
  final RecipeGeneratorRepository recipeGeneratorRepository;
  GenerateDailyRecipeCubit(this.recipeGeneratorRepository)
      : super(GenerateDailyRecipeInitial());

  Future<void> generateDailyRecipe() async {
    emit(GenerateDailyRecipeLoading());
    try {
      final recipes = await recipeGeneratorRepository.generateDailyRecipe();
      emit(GenerateDailyRecipeSuccess(recipes: recipes));
    } catch (e) {
      emit(GenerateDailyRecipeFailure(error: e.toString()));
    }
  }
}
