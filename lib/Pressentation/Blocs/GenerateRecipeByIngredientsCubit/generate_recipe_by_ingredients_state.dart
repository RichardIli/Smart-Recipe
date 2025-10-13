part of 'generate_recipe_by_ingredients_cubit.dart';

@immutable
sealed class GenerateRecipeByIngredientsState {}

final class GenerateRecipeByIngredientsInitial
    extends GenerateRecipeByIngredientsState {}

final class GenerateRecipeByIngredientsLoading
    extends GenerateRecipeByIngredientsState {}

final class GenerateRecipeByIngredientsSuccess
    extends GenerateRecipeByIngredientsState {
  final List<Recipe> recipes;
  GenerateRecipeByIngredientsSuccess(this.recipes);
}

final class GenerateRecipeByIngredientsFailure
    extends GenerateRecipeByIngredientsState {
  final String error;
  GenerateRecipeByIngredientsFailure(this.error);
}
