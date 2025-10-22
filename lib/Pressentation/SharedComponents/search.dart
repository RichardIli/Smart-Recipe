import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Config/routes/routes.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/SearchRecipeByNameCubit/search_recipe_by_name_cubit.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/ToggleThemeCubit/toggle_theme_cubit.dart';

class Search extends StatelessWidget {
  const Search({super.key, this.searchController});

  final TextEditingController? searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: MediaQuery.of(context).size.width > 600
            ? MediaQuery.of(context).size.width * 0.6
            : MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Theme.of(context).colorScheme.secondary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: SearchBar(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: searchController,
                hintText: 'Search...',
                hintStyle: WidgetStatePropertyAll(
                  TextStyle(color: Colors.grey),
                ),
                leading: Icon(Icons.search, color: Colors.grey),
                elevation: WidgetStatePropertyAll(0),

                onSubmitted: (searchTerm) {
                  if (searchTerm.trim().isNotEmpty) {
                    context.read<SearchRecipeByNameCubit>().searchRecipeByName(
                      searchTerm.trim(),
                    );
                    Navigator.of(context).pushNamed(findRecipesActionScreen);
                  }
                },

                trailing: [
                  IconButton(
                    icon: BlocBuilder<ToggleThemeCubit, ToggleThemeState>(
                      builder: (context, state) {
                        return Icon(
                          state is ToggleThemeDark
                              ? Icons.dark_mode_rounded
                              : Icons.light_mode_rounded,
                          color: Colors.black,
                        );
                      },
                    ),
                    onPressed: () {
                      context.read<ToggleThemeCubit>().toggleTheme();
                    },
                  ),
                  // maybe in the future change it to a mic icon for voice search
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
