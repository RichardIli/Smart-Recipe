import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Models/recipe.dart';
import 'package:smart_recipe_app/Themes/themes.dart';

class DailyInspirationCard extends StatelessWidget {
  const DailyInspirationCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final cardColor = [
      Color(0xFFB3E5FC), // Blue 100
      Color(0xFFC8E6C9), // Green 100
      Color(0xFFFFF9C4), // Yellow 100
      Color(0xFFFFCCBC), // Orange 100
      Color(0xFFD1C4E9), // Purple 100
      Color(0xFFFFCDD2), // Red 100
    ];
    final selectedCardColor =
        (cardColor..shuffle()).first; // Randomly select a color from the list
    return SizedBox.square(
      dimension: 300,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: selectedCardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  recipe.foodCategory,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    // Adjusting the text color based on the card color
                    // to ensure good contrast and readability
                    color: HSLColor.fromColor(selectedCardColor)
                        .withLightness(
                          (HSLColor.fromColor(selectedCardColor).lightness -
                                  0.5)
                              .clamp(0.0, 1.0),
                        )
                        .toColor(),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(recipe.foodName, style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    recipe.preparationTime,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.grey[600]),
                  ),
                  Text(
                    recipe.difficulty,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
