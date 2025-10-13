part of 'generate_recipe_by_category_cubit.dart';

@immutable
sealed class GenerateRecipeByCategoryState {}

final class GenerateRecipeByCategoryInitial
    extends GenerateRecipeByCategoryState {}

final class GenerateRecipeByCategoryLoading
    extends GenerateRecipeByCategoryState {}

final class GenerateRecipeByCategorySuccess
    extends GenerateRecipeByCategoryState {
  final List<Recipe> recipes;
  GenerateRecipeByCategorySuccess(this.recipes);
}

final class GenerateRecipeByCategoryFailure
    extends GenerateRecipeByCategoryState {
  final String error;
  GenerateRecipeByCategoryFailure(this.error);
}
