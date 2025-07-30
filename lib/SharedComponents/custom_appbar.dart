import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Blocs/SearchRecipeByNameCubit/search_recipe_by_name_cubit.dart';
import 'package:smart_recipe_app/routes/routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onActionPressed;
  final TextEditingController? searchController;
  final String? logoAsset;
  final IconData actionIcon;

  const CustomAppBar({
    super.key,
    this.onActionPressed,
    this.searchController,
    this.logoAsset,
    this.actionIcon = Icons.notifications,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      titleSpacing: 0,
      shadowColor: Colors.black,
      title: Row(
        children: [
          // Logo on the left
          // if (logoAsset != null)
          //   Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //     child: Image.asset(logoAsset!, height: 32),
          //   ),
          // SearchBar widget in the middle
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: kToolbarHeight * 0.6, // Reduce height of SearchBar
                  child: SearchBar(
                    controller: searchController,
                    hintText: 'Search...',
                    leading: const Icon(Icons.search),
                    elevation: WidgetStatePropertyAll(0),
                    onSubmitted: (searchTerm) {
                      if (searchTerm.trim().isNotEmpty) {
                        context
                            .read<SearchRecipeByNameCubit>()
                            .searchRecipeByName(searchTerm.trim());
                        // Navigate to the searched screen after enterring the search term
                        Navigator.of(context).pushNamed(searchedRecipeScreen);
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(actionIcon, color: Colors.black),
          onPressed: onActionPressed,
        ),
      ],
    );
  }
}
