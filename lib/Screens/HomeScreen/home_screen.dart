import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/GenerateDailyRecipeCubit/generate_daily_recipe_cubit.dart';
import 'package:smart_recipe_app/Blocs/GenerateRecipeByIngredientsCubit/generate_recipe_by_ingredients_cubit.dart';
import 'package:smart_recipe_app/Blocs/IngredientsListCubit/ingredients_list_cubit.dart';
import 'package:smart_recipe_app/Screens/HomeScreen/QuickActionsSection/actions_grid.dart';
import 'package:smart_recipe_app/Screens/HomeScreen/DailyInspirationRecipeSection/daily_inspiration_cards_generator.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_list_view_builder.dart';
import 'package:smart_recipe_app/SharedComponents/recipe_shimmer.dart';
import 'package:smart_recipe_app/SharedComponents/failed_to_fetch_recipe_card.dart';
import 'package:smart_recipe_app/SharedComponents/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onActionPressed: () {
            // TODO: Implement action when the icon is pressed
          },
          searchController: searchController,
          logoAsset: 'assets/logo.png', // Replace with your logo asset path
          actionIcon: Icons.settings_rounded,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                Text(
                  "Quick Actions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // Actions grid
                ActionsGrid(),
                Text(
                  "Daily Inspiration",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // Daily Inspiration Cards List
                BlocBuilder<GenerateDailyRecipeCubit, GenerateDailyRecipeState>(
                  builder: (context, state) {
                    if (state is GenerateDailyRecipeInitial) {
                      // Trigger the cubit to fetch recipes when the screen loads
                      context
                          .read<GenerateDailyRecipeCubit>()
                          .generateDailyRecipe();
                      return RecipeShimmer();
                    } else if (state is GenerateDailyRecipeLoading) {
                      return RecipeShimmer();
                    } else if (state is GenerateDailyRecipeSuccess) {
                      return DailyInspirationCardsGenerator(
                        recipes: state.recipes,
                      );
                    } else if (state is GenerateDailyRecipeFailure) {
                      return FailedToFetchRecipeCard(
                        error: state.error.toString(),
                        refresh: () => context
                            .read<GenerateDailyRecipeCubit>()
                            .generateDailyRecipe(),
                      );
                    }
                    return Container();
                  },
                ),
                Text(
                  "Based on Your Ingredients",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child:
                      BlocBuilder<
                        GenerateRecipeByIngredientsCubit,
                        GenerateRecipeByIngredientsState
                      >(
                        builder: (context, state) {
                          if (state is GenerateRecipeByIngredientsInitial) {
                            return Center(
                              child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Please add ingredients to the fridge to see recipes based on them.",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                            );
                          } else if (state
                              is GenerateRecipeByIngredientsLoading) {
                            return RecipeShimmerList();
                          } else if (state
                              is GenerateRecipeByIngredientsSuccess) {
                            return RecipeListViewBuilder(
                              recipes: state.recipes,
                            );
                          } else if (state
                              is GenerateRecipeByIngredientsFailure) {
                            return FailedToFetchRecipeCard(
                              error: state.error,
                              refresh: () => context
                                  .read<GenerateRecipeByIngredientsCubit>()
                                  .generateRecipes(
                                    (context.read<IngredientsListCubit>().state
                                            as IngredientsList)
                                        .ingredients,
                                    null,
                                  ),
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
