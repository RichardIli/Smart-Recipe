import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/HomeScreenBlocs/GenerateDailyRecipeCubit/generate_daily_recipe_cubit.dart';
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
      child: BlocProvider(
        create: (context) => GenerateDailyRecipeCubit(
          RepositoryProvider.of<RecipeGeneratorRepository>(context),
        ),
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
