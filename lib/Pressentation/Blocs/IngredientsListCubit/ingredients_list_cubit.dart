import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ingredients_list_state.dart';

class IngredientsListCubit extends Cubit<IngredientsListState> {
  IngredientsListCubit() : super(IngredientsList(ingredients: []));

  void addIngredient(List<String> ingredients) {
    final currentState = state;
    if (currentState is IngredientsList) {
      final updatedIngredients = List<String>.from(currentState.ingredients)
        ..addAll(ingredients);
      emit(IngredientsList(ingredients: updatedIngredients));
    } else {
      emit(IngredientsList(ingredients: ingredients));
    }
  }
  void removeIngredient(String ingredient) {
    final currentState = state;
    if (currentState is IngredientsList) {
      final updatedIngredients = List<String>.from(currentState.ingredients)
        ..remove(ingredient);
      emit(IngredientsList(ingredients: updatedIngredients));
    }
  }
}
