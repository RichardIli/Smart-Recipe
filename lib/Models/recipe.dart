class Recipe {
  final String foodCategory;
  final String foodName;
  final List<String> ingredients;
  final String preparationTime;
  final String difficulty;
  final String process;

  const Recipe({
    required this.foodCategory,
    required this.foodName,
    required this.ingredients,
    required this.preparationTime,
    required this.difficulty,
    required this.process,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      foodCategory: json['foodCategory'] as String,
      foodName: json['foodName'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      preparationTime: json['preparationTime'] as String,
      difficulty: json['difficulty'] as String,
      process: json['process'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'foodCategory': foodCategory,
    'foodName': foodName,
    'ingredients': ingredients,
    'preparationTime': preparationTime,
    'difficulty': difficulty,
    'process': process,
  };
}
