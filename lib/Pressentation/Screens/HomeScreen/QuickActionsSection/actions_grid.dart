import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Pressentation/Screens/HomeScreen/QuickActionsSection/quick_actions_card.dart';
import 'package:smart_recipe_app/Pressentation/Screens/HomeScreen/QuickActionsSection/whats_on_your_fridge_action_window.dart';
import 'package:smart_recipe_app/Config/routes/routes.dart';

class ActionsGrid extends StatelessWidget {
  const ActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxCrossAxisExtent = 400;
    const double crossAxisSpacing = 10;
    const int itemCount = 2;

    // Calculate the width required for the grid.
    // This prevents the GridView from taking up the full screen width.
    final double gridWidth = (itemCount * maxCrossAxisExtent) + ((itemCount - 1) * crossAxisSpacing);

    return Center(
      child: SizedBox(
        width: gridWidth,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxCrossAxisExtent,
            mainAxisSpacing: 10,
            crossAxisSpacing: crossAxisSpacing,
            childAspectRatio: 1,
            mainAxisExtent: 150,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            final List<Map<String, dynamic>> actions = [
              {
                'bgColor': Colors.blue[100],
                'lblColor': Colors.blue[700],
                'lbl': "What's in my fridge?",
                'icon': Icons.kitchen_rounded,
                'ontap': () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const WhatsOnYourFridgeActionWindow();
                    },
                  );
                },
              },
              // {
              //   'bgColor': Colors.purple[100],
              //   'lblColor': Colors.purple[700],
              //   'lbl': "Find a Recipes",
              //   'icon': Icons.menu_book_rounded,
              //   'ontap': () {
              //     Navigator.pushNamed(context, findRecipesActionScreen);
              //   },
              // },
              {
                'bgColor': Colors.yellow[100],
                'lblColor': Colors.yellow[700],
                'lbl': "My Favorites",
                'icon': Icons.favorite_outline_rounded,
                'ontap': () {
                  Navigator.pushNamed(context, favoriteRecipeScreen);
                }
              },
            ];
            final action = actions[index];
            return QuickActionsCard(
              bgColor: action['bgColor'],
              lblColor: action['lblColor'],
              lbl: action['lbl'],
              icon: action['icon'],
              onTap: action['ontap'],
            );
          },
        ),
      ),
    );
  }
}
