import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:smart_recipe_app/Screens/QuickActionsSection/quick_actions_card.dart';
import 'package:smart_recipe_app/Themes/themes.dart';

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
                  return IngredientsInputWindow();
                },
              );
            },
          },
          {
            'bgColor': Colors.purple[100],
            'lblColor': Colors.purple[700],
            'lbl': "Find a Recipes",
            'icon': Icons.menu_book_rounded,
          },
          {
            'bgColor': Colors.yellow[100],
            'lblColor': Colors.yellow[700],
            'lbl': "My Favorites",
            'icon': Icons.favorite_outline_rounded,
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

class IngredientsInputWindow extends StatelessWidget {
  const IngredientsInputWindow({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredients = ["milk", "eggs", "flour"];
    return AlertDialog(
      title: const Text("Whats on your fridge?"),
      content: Column(
        children: [
          TextFormField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.add_rounded),
              hintText: "Add ingredient (e.g., 'milk', 'eggs')",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kSecondaryColor),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: DashedBorder.fromBorderSide(
                dashLength: 10,
                side: BorderSide(color: Colors.black, width: 1),
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Wrap(
              spacing: 10,
              children: List.generate(ingredients.length, (index) {
                return Chip(
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  label: Text(
                    ingredients[index],
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(color: kSecondaryColor),
                  ),
                  color: WidgetStatePropertyAll(
                    kSecondaryColor.withValues(
                      alpha: 0.2,
                    ), // lighter version of kSecondaryColor
                  ),

                  deleteIcon: Icon(Icons.close_rounded, color: kSecondaryColor),
                  onDeleted: () {},
                );
              }),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.grey),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Find Recipes")),
      ],
    );
  }
}
