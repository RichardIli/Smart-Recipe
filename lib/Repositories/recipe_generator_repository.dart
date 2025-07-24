import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_recipe_app/Models/recipe.dart';

class RecipeGeneratorRepository {
  Future<List<Recipe>> _postAndParseRecipes({
    required String? endpoint,
    Map<String, dynamic>? body,
  }) async {
    if (endpoint == null || endpoint.isEmpty) {
      throw Exception('API endpoint not found in .env file');
    }
    final url = Uri.parse(endpoint);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body != null ? jsonEncode(body) : null,
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to fetch recipes: ${response.statusCode}\n${response.body}',
      );
    }
  }

  Future<List<Recipe>> generateRecipe({
    required String ingredients,
    required String category,
  }) {
    return _postAndParseRecipes(
      endpoint: dotenv.env['GENERATE_RECIPE_API_ENDPOINT'],
      body: {'ingredients': ingredients, 'category': category},
    );
  }

  Future<List<Recipe>> generateDailyRecipe() {
    return _postAndParseRecipes(
      endpoint: dotenv.env['GENERATE_DAILY_RECIPE_API_ENDPOINT'],
    );
  }

  Future<List<Recipe>> generateRecipeByName({required String recipeName}) {
    return _postAndParseRecipes(
      endpoint: dotenv.env['GENERATE_RECIPE_BY_NAME_API_ENDPOINT'],
      body: {'foodName': recipeName},
    );
  }

  Future<List<Recipe>> generateRecipeByCategory({
    required String foodCategory,
  }) {
    return _postAndParseRecipes(
      endpoint: dotenv.env['GENERATE_RECIPE_BY_CATEGORY_API_ENDPOINT'],
      body: {'foodCategory': foodCategory},
    );
  }
}
