import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/FavoritesCubit/favorites_cubit.dart';
import 'package:smart_recipe_app/Blocs/GenerateDailyRecipeCubit/generate_daily_recipe_cubit.dart';
import 'package:smart_recipe_app/Blocs/GenerateRecipeByCategoryCubit/generate_recipe_by_category_cubit.dart';
import 'package:smart_recipe_app/Blocs/GenerateRecipeByIngredientsCubit/generate_recipe_by_ingredients_cubit.dart';
import 'package:smart_recipe_app/Blocs/IngredientsListCubit/ingredients_list_cubit.dart';
import 'package:smart_recipe_app/Blocs/SearchRecipeByNameCubit/search_recipe_by_name_cubit.dart';
import 'package:smart_recipe_app/Repositories/recipe_generator_repository.dart';
import 'package:smart_recipe_app/Themes/themes.dart';
import 'package:smart_recipe_app/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RecipeGeneratorRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GenerateDailyRecipeCubit(
              RepositoryProvider.of<RecipeGeneratorRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SearchRecipeByNameCubit(
              RepositoryProvider.of<RecipeGeneratorRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => GenerateRecipeByCategoryCubit(
              RepositoryProvider.of<RecipeGeneratorRepository>(context),
            ),
          ),
          BlocProvider(create: (context) => IngredientsListCubit()),
          BlocProvider(
            create: (context) => GenerateRecipeByIngredientsCubit(
              RepositoryProvider.of<RecipeGeneratorRepository>(context),
            ),
          ),
          BlocProvider(create: (context) => FavoritesCubit()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: appTheme,
          onGenerateRoute: generateRoute,
          initialRoute: homeScreen,
        ),
      ),
    );
  }
}
