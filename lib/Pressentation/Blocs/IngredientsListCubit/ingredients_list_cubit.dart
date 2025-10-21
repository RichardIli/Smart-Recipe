import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ingredients_list_state.dart';

class IngredientsListCubit extends Cubit<IngredientsListState> {
  IngredientsListCubit() : super(IngredientsList(ingredients: []));

  void addIngredient(String ingredient) {
    final currentState = state;
    if (currentState is IngredientsList) {
      final ingredientLower = ingredient.toLowerCase();
      final existingIngredientsLower =
          currentState.ingredients.map((e) => e.toLowerCase()).toList();

      if (existingIngredientsLower.contains(ingredientLower)) {
        // Ingredient already exists (case-insensitive), emit the original list
        emit(IngredientsList(ingredients: currentState.ingredients));
      } else {
        // Ingredient does not exist, add it to the list
        final updatedIngredients = List<String>.from(currentState.ingredients)
          ..add(ingredient);
        emit(IngredientsList(ingredients: updatedIngredients));
      }
    } else {
      // If the current state is not IngredientsList, start a new list
      emit(IngredientsList(ingredients: [ingredient]));
    }
  }

  void removeIngredient(String ingredient) {
    final currentState = state;
    if (currentState is IngredientsList) {
      final updatedIngredients = List<String>.from(currentState.ingredients)
        ..removeWhere((element) => element.toLowerCase() == ingredient.toLowerCase());
      emit(IngredientsList(ingredients: updatedIngredients));
    }
  }
}
