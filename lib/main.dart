import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Data/Repositories/image_fetcher_repository.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/FavoritesCubit/favorites_cubit.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/GenerateDailyRecipeCubit/generate_daily_recipe_cubit.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/GenerateRecipeByCategoryCubit/generate_recipe_by_category_cubit.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/GenerateRecipeByIngredientsCubit/generate_recipe_by_ingredients_cubit.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/IngredientsListCubit/ingredients_list_cubit.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/SearchRecipeByNameCubit/search_recipe_by_name_cubit.dart';
import 'package:smart_recipe_app/Data/Repositories/recipe_generator_repository.dart';
import 'package:smart_recipe_app/Config/Themes/themes.dart';
import 'package:smart_recipe_app/Config/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // ensure the file name matches the asset above
    await dotenv.load(fileName: ".env");
  } catch (e, st) {
    // don't crash the app in release if .env is missing
    // you can log to console or use a remote crash logger instead
    // ignore: avoid_print
    print('Failed to load .env: $e\n$st');
  }

  // Set the system UI overlay style to match the app theme
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    // Set the status bar color to transparent
    statusBarColor: Colors.transparent,

    // Set status bar icons to light (white) for contrast
    statusBarIconBrightness: Brightness.light, // For Android

    // Set status bar text/icons to light (white) for contrast
    // This setting is primarily for iOS but good practice to include
    statusBarBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => RecipeGeneratorRepository()),
        RepositoryProvider(create: (context) => ImageFetcherRepository()),
      ],
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
          debugShowCheckedModeBanner: false,
          title: 'Smart Recipe',
          theme: lightTheme, // Use the light theme
          // darkTheme: darkTheme, // No need for dark theme
          themeMode: ThemeMode.light, // Always use light theme
          onGenerateRoute: generateRoute,
          initialRoute: homeScreen,
        ),
      ),
    );
  }
}
