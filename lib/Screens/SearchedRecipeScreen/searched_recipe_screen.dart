import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/SearchRecipeByNameCubit/search_recipe_by_name_cubit.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_list_view_builder.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_shimmer.dart';

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
            child:
                BlocBuilder<SearchRecipeByNameCubit, SearchRecipeByNameState>(
                  builder: (context, state) {
                    if (state is SearchRecipeByNameLoading) {
                      return CustomColumn(
                        formKey: formKey,
                        initialValue: state.recipeName,
                        stateUi: RecipeShimmerList(),
                      );
                    } else if (state is SearchRecipeByNameFailure) {
                      return CustomColumn(
                        formKey: formKey,
                        initialValue: state.recipeName,
                        stateUi: Center(child: Text("Failed to fetch recipes")),
                      );
                    } else if (state is SearchRecipeByNameSuccess) {
                      final List<Recipe> recipes = state.recipes;
                      return CustomColumn(
                        formKey: formKey,
                        initialValue: state.recipeName,
                        stateUi: SearchedItemLoaded(
                          formKey: formKey,
                          recipes: recipes,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
          ),
        ),
      ),
    );
  }
}

class CustomColumn extends StatelessWidget {
  const CustomColumn({
    super.key,
    required this.formKey,
    required this.initialValue,
    required this.stateUi,
  });

  final GlobalKey<FormState> formKey;
  final String initialValue;
  final Widget stateUi;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        TextFormField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search for recipe name",
          ),
          initialValue: initialValue,
          onFieldSubmitted: (value) {
            if (formKey.currentState!.validate()) {
              context.read<SearchRecipeByNameCubit>().searchRecipeByName(
                value.trim(),
              );
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a recipe name to search";
            }
            return null;
          },
        ),
        Expanded(child: stateUi),
      ],
    );
  }
}

class SearchedItemLoaded extends StatelessWidget {
  const SearchedItemLoaded({
    super.key,
    required this.formKey,
    required this.recipes,
  });

  final GlobalKey<FormState> formKey;
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return RecipeListViewBuilder(recipes: recipes);
  }
}
