import 'package:flutter/material.dart';
import 'package:smart_recipe_app/Screens/HomeScreen/QuickActionsSection/quick_actions_card.dart';
import 'package:smart_recipe_app/Screens/HomeScreen/QuickActionsSection/whats_on_your_fridge_action_window.dart';
import 'package:smart_recipe_app/routes/routes.dart';

class ActionsGrid extends StatelessWidget {
  const ActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        mainAxisExtent: 150,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        final List<Map<String, dynamic>> actions = [
          {
            'bgColor': Colors.blue[100],
            'lblColor': Colors.blue[700],
            'lbl': "What's in my fridge?",
            'icon': Icons.dashboard_customize_rounded,
            'ontap': () {
              showDialog(
                context: context,
                builder: (context) {
                  return WhatsOnYourFridgeActionWindow();
                },
              );
            },
          },
          {
            'bgColor': Colors.purple[100],
            'lblColor': Colors.purple[700],
            'lbl': "Find a Recipes",
            'icon': Icons.menu_book_rounded,
            'ontap': () {
              Navigator.pushNamed(context, findRecipesActionScreen);
            },
          },{
            'bgColor': Colors.yellow[100],
            'lblColor': Colors.yellow[700],
            'lbl': "My Favorites",
            'icon': Icons.favorite_outline_rounded,
            'ontap':(){
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
    );
  }
}
