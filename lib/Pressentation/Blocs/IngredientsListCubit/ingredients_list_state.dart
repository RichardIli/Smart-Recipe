part of 'ingredients_list_cubit.dart';

@immutable
sealed class IngredientsListState {}

final class IngredientsList extends IngredientsListState {
  final List<String> ingredients;

  IngredientsList({required this.ingredients});
}
