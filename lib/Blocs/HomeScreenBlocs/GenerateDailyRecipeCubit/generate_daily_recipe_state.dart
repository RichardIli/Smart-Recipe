part of 'generate_daily_recipe_cubit.dart';

@immutable
sealed class GenerateDailyRecipeState {}

final class GenerateDailyRecipeInitial extends GenerateDailyRecipeState {}

final class GenerateDailyRecipeLoading extends GenerateDailyRecipeState {}

final class GenerateDailyRecipeSuccess extends GenerateDailyRecipeState {
  final List<Recipe> recipes;
  GenerateDailyRecipeSuccess({required this.recipes});
}

final class GenerateDailyRecipeFailure extends GenerateDailyRecipeState {
  final String error;
  GenerateDailyRecipeFailure({required this.error});
}
