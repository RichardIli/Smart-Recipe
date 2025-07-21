import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Screens/Widgets/actions_grid.dart';
import 'package:smart_recipe_app/Screens/Widgets/daily_inspiration_card.dart';
import 'package:smart_recipe_app/Screens/Widgets/daily_inspiration_cards_generator.dart';
import 'package:smart_recipe_app/SharedComponents/custom_appbar.dart';
import 'package:smart_recipe_app/Themes/themes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onActionPressed: () {
            // TODO: Implement action when the icon is pressed
          },
          searchController: TextEditingController(),
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
                DailyInspirationCardsGenerator(),
                Text(
                  "Based on Your Ingredients",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
