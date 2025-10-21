import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Data/Models/recipe.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/FetchImageCubit/fetch_image_cubit.dart';
import 'package:smart_recipe_app/Pressentation/SharedComponents/favorite_button.dart';
import 'package:smart_recipe_app/Pressentation/SharedComponents/recipe_shimmer.dart';

class RecipeDetailsWindow extends StatelessWidget {
  const RecipeDetailsWindow({
    super.key,
    required this.recipe,
    required this.index,
    this.imageUrl,
  });

  final Recipe recipe;
  final int index;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final double dimension = MediaQuery.of(context).size.width * 0.8;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          insetPadding: EdgeInsets.zero, // Remove default padding
          clipBehavior: Clip.antiAlias,
          contentPadding: EdgeInsets.zero,
          // title: Text(recipe.foodName),
          content: SizedBox(
            width: constraints.maxWidth, // Use the available width
            height: constraints.maxHeight, // Use the available height
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  // image of the item
                  SizedBox.square(
                    dimension: constraints.maxWidth,
                    child: itemImage(imageUrl: imageUrl, dimension: dimension),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          recipe.foodName,
                          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FavoriteButton(recipe: recipe),
                    ],
                  ),
                  Text(
                    recipe.foodCategory,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    recipe.preparationTime,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  Text(recipe.difficulty),
                  Text(
                    "Ingredients",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(recipe.ingredients.join('\n')),
                  Text(
                    "Instruction",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(recipe.process),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }

  Widget itemImage({required String? imageUrl, required double dimension}) {
    return imageUrl == null || imageUrl.isEmpty
        ? BlocBuilder<FetchImageCubit, FetchImageState>(
            builder: (context, state) {
              if (state is FetchImageInitial) {
                // Trigger the cubit to fetch image when the card builds
                context.read<FetchImageCubit>().fetchImage(recipe.foodName);
                return RecipeShimmer(boxDimension: dimension);
              } else if (state is FetchImageLoading) {
                return RecipeShimmer(boxDimension: dimension);
              } else if (state is FetchImageSuccess) {
                if (state.imageUrl.isNotEmpty) {
                  return displayImage(state.imageUrl);
                } else {
                  return Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey[600],
                  );
                }
              } else if (state is FetchImageFailure) {
                return Icon(Icons.error, size: 50, color: Colors.red);
              }
              return Container();
            },
          )
        : displayImage(imageUrl);
  }

  ClipRRect displayImage(String imageUrl) {
    return ClipRRect(
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: double.infinity, // Ensure it takes full width
        height: double.infinity, // Ensure it takes full height
      ),
    );
  }
}
