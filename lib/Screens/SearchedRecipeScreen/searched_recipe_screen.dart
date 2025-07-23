import 'package:flutter/material.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_card.dart';

class SearchedRecipeScreen extends StatelessWidget {
  const SearchedRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Searched Recipes")),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 10,
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search for recipe name",
                  ),
                  onFieldSubmitted: (value) {
                    if (formKey.currentState!.validate()) {
                      // Trigger search action
                      // TODO: make a bloc/cubit for searching recipes by name
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a recipe name to search";
                    }
                    return null;
                  },
                ),
                // TODO: wrap it under blocbuilder
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return RecipeCard(recipe: recipe);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
