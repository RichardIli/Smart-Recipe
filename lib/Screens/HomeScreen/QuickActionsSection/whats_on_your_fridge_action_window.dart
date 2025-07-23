import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:smart_recipe_app/Themes/themes.dart';

class WhatsOnYourFridgeActionWindow extends StatelessWidget {
  const WhatsOnYourFridgeActionWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredients = [
      "milk",
      "eggs",
      "flour",
      "sugar",
      "butter",
      "salt",
      "pepper",
      "chicken",
      "tomato",
      "onion",
      "garlic",
      "cheese",
      "spinach",
      "carrot",
    ];
    final recommendedIngredients = ["milk", "eggs", "flour", "sugar", "butter"];
    return AlertDialog(
      title: const Text("Whats on your fridge?"),
      content: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
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
            ),
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
              child: SingleChildScrollView(
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
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge!.copyWith(color: kSecondaryColor),
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
                      onDeleted: () {},
                    );
                  }),
                ),
              ),
            ),
            Text("Quick Add", style: Theme.of(context).textTheme.bodyLarge),
            Wrap(
              spacing: 10,
              children: List.generate(recommendedIngredients.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ActionChip(
                    label: Text(recommendedIngredients[index]),
                    onPressed: () {
                      // Logic to add the ingredient
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
            // TODO: make a bloc that generates recipes based on the ingredients added, Then will close the window and will be scrolled on the bottom of the screen.
            // Make a bloc that will hold the list of ingredients and will generate recipes based on the ingredients added.
            // it should be like this:

            // {"ingredients" = ["milk", "eggs", "flour", "sugar", "butter"],"recipes" = [{recipe1, recipe2,...}]}
            // make sure that the ingredients persists in the bloc state
            // and the recipes are generated based on the ingredients added.
            Navigator.pop(context);
          },
          child: Text("Find Recipes"),
        ),
      ],
    );
  }
}
