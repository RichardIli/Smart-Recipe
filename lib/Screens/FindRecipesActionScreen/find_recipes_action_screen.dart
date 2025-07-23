import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/HomeScreenBlocs/GenerateDailyRecipeCubit/generate_daily_recipe_cubit.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/SharedComponents/failed_to_fetch_recipe_card.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_card.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_shimmer.dart';
import 'package:smart_recipe_app/Themes/themes.dart';

class FindRecipesActionScreen extends StatelessWidget {
  const FindRecipesActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Find A Recipe")),
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
                    hintText: "Search for recipes (e.g., 'pasta', 'salad')",
                    
                  ),
                  onFieldSubmitted: (value) => {
                    if (formKey.currentState!.validate())
                      {
                        context
                            .read<GenerateDailyRecipeCubit>()
                            .generateDailyRecipe(),
                      },
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a search recipe (e.g., 'pasta', 'salad')";
                    }
                    return null;
                  },
                ),
                BlocBuilder<GenerateDailyRecipeCubit, GenerateDailyRecipeState>(
                  builder: (context, state) {
                    // TODO: Make a bloc/cubit for generating recipe based on the inputed recipe
                    if (state is GenerateDailyRecipeLoading) {
                      return RecipeShimmer();
                    } else if (state is GenerateDailyRecipeSuccess) {
                      final List<Recipe> recipes = state.recipes;
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                        ),
                        itemCount: recipes.length, // Example item count
                        itemBuilder: (context, index) {
                          return RecipeCard(recipe: recipes[index]);
                        },
                      );
                    } else if (state is GenerateDailyRecipeFailure) {
                      return FailedToFetchRecipeCard(error: state.error);
                    }
                    return Container();
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
