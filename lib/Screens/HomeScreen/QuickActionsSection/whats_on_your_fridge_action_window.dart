import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:smart_recipe_app/Blocs/GenerateRecipeByIngredientsCubit/generate_recipe_by_ingredients_cubit.dart';
import 'package:smart_recipe_app/Blocs/IngredientsListCubit/ingredients_list_cubit.dart';
import 'package:smart_recipe_app/Themes/themes.dart';

class WhatsOnYourFridgeActionWindow extends StatelessWidget {
  const WhatsOnYourFridgeActionWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final recommendedIngredients = ["milk", "eggs", "flour", "sugar", "butter"];
    return AlertDialog(
      title: const Text("Whats on your fridge?"),
      content: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            // TextField for adding ingredients
            TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_rounded),
                hintText: "Add ingredient (e.g., 'milk', 'eggs')",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onFieldSubmitted: (value) =>
                  context.read<IngredientsListCubit>().addIngredient([value]),
            ),
            // Container for displaying added ingredients
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 50),
              decoration: BoxDecoration(
                border: DashedBorder.fromBorderSide(
                  dashLength: 5,
                  side: BorderSide(color: Colors.black, width: 1),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: BlocBuilder<IngredientsListCubit, IngredientsListState>(
                builder: (context, state) {
                  if (state is IngredientsList) {
                    // If the state is IngredientsList, display the ingredients
                    final ingredients = state.ingredients;
                    return SingleChildScrollView(
                      child: Wrap(
                        spacing: 10,
                        children: List.generate(ingredients.length, (index) {
                          return Chip(
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            label: Text(
                              ingredients[index],
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(color: kSecondaryColor),
                            ),
                            color: WidgetStatePropertyAll(
                              kSecondaryColor.withValues(
                                alpha: 0.2,
                              ), // lighter version of kSecondaryColor
                            ),

                            deleteIcon: Icon(
                              Icons.close_rounded,
                              color: kSecondaryColor,
                            ),
                            onDeleted: () {
                              // Logic to remove the ingredient
                              context
                                  .read<IngredientsListCubit>()
                                  .removeIngredient(ingredients[index]);
                            },
                          );
                        }),
                      ),
                    );
                  }
                  // If the state is not IngredientsList, show a loading indicator
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
            // ActionChip for quick adding ingredients
            Text("Quick Add", style: Theme.of(context).textTheme.bodyLarge),
            // Wrap with ActionChips for recommended ingredients
            Wrap(
              spacing: 10,
              children: List.generate(recommendedIngredients.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ActionChip(
                    label: Text(recommendedIngredients[index]),
                    onPressed: () {
                      // Logic to add the ingredient
                      context.read<IngredientsListCubit>().addIngredient([
                        recommendedIngredients[index],
                      ]);
                    },
                    backgroundColor: Colors.grey[200],
                    labelStyle: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: Colors.black),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey[200]),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: TextStyle(color: Colors.black)),
        ),
        ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            ),
          ),
          onPressed: () {
            context.read<GenerateRecipeByIngredientsCubit>().generateRecipes(
              (context.read<IngredientsListCubit>().state as IngredientsList)
                  .ingredients,
              null,
            );
            Navigator.pop(context);
          },
          child: Text("Find Recipes"),
        ),
      ],
    );
  }
}
