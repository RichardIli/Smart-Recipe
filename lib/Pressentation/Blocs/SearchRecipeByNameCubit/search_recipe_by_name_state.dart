part of 'search_recipe_by_name_cubit.dart';

@immutable
sealed class SearchRecipeByNameState {}

final class SearchRecipeByNameInitial extends SearchRecipeByNameState {}

final class SearchRecipeByNameLoading extends SearchRecipeByNameState {
  final String recipeName;
  SearchRecipeByNameLoading(this.recipeName);
}

final class SearchRecipeByNameSuccess extends SearchRecipeByNameState {
  final String recipeName;
  final List<Recipe> recipes;
  SearchRecipeByNameSuccess(this.recipeName, this.recipes);
}

final class SearchRecipeByNameFailure extends SearchRecipeByNameState {
  final String recipeName;
  final String error;
  SearchRecipeByNameFailure(this.recipeName, this.error);
}
