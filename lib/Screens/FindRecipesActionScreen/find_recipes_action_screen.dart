import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/GenerateRecipeByCategoryCubit/generate_recipe_by_category_cubit.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/SharedComponents/failed_to_fetch_recipe_card.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_list_view_builder.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_shimmer.dart';

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
                            .read<GenerateRecipeByCategoryCubit>()
                            .generateRecipeByCategory(value.trim()),
                      },
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a search recipe (e.g., 'pasta', 'salad')";
                    }
                    return null;
                  },
                ),
                Expanded(
                  child: BlocBuilder<
                    GenerateRecipeByCategoryCubit,
                    GenerateRecipeByCategoryState
                  >(
                    builder: (context, state) {
                      if (state is GenerateRecipeByCategoryLoading) {
                        return RecipeShimmerList();
                      } else if (state is GenerateRecipeByCategorySuccess) {
                        final List<Recipe> recipes = state.recipes;
                        return RecipeListViewBuilder(recipes: recipes);
                      } else if (state is GenerateRecipeByCategoryFailure) {
                        return FailedToFetchRecipeCard(
                          error: state.error,
                          refresh: null,
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
