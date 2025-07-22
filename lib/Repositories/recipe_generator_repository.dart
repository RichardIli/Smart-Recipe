import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:smart_recipe_app/Models/recipe.dart';

class RecipeGeneratorRepository {
  Future<List<Recipe>> generateRecipe({
    required String ingredients,
    required String category,
  }) async {
    final apiEndpoint = dotenv.env['GENERATE_RECIPE_API_ENDPOINT'];
    if (apiEndpoint == null || apiEndpoint.isEmpty) {
      throw Exception('API endpoint not found in .env file');
    }
    final url = Uri.parse(apiEndpoint);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'ingredients': ingredients, 'category': category}),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch recipes: \\${response.statusCode}');
    }
  }

  Future<List<Recipe>> generateDailyRecipe() async {
    final apiEndpoint = dotenv.env['GENERATE_DAILY_RECIPE_API_ENDPOINT'];
    if (apiEndpoint == null || apiEndpoint.isEmpty) {
      throw Exception('API endpoint not found in .env file');
    }
    final url = Uri.parse(apiEndpoint);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => Recipe.fromJson(item as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to fetch recipes: \\${response.statusCode}');
    }
  }
}
