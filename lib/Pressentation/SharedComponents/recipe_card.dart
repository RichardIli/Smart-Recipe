import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recipe_app/Data/Models/recipe.dart';
import 'package:smart_recipe_app/Data/Repositories/image_fetcher_repository.dart';
import 'package:smart_recipe_app/Pressentation/Blocs/FetchImageCubit/fetch_image_cubit.dart';
import 'package:smart_recipe_app/Pressentation/SharedComponents/favorite_button.dart';
import 'package:smart_recipe_app/Pressentation/SharedComponents/recipe_details_window.dart';
import 'package:smart_recipe_app/Config/Themes/themes.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.index, required this.recipe});

  final int index;
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
    final double dimension = MediaQuery.of(context).size.width * 0.8;
    final fetchImageCubit = FetchImageCubit(
      imageFetcherRepository: RepositoryProvider.of<ImageFetcherRepository>(
        context,
      ),
    );
    return BlocProvider.value(
      value: fetchImageCubit,
      child: SizedBox.square(
        dimension: dimension,
        child: GestureDetector(
          onTap: () {
            // change this to a new screen. its not good for UX to have dialogs within scrollable areas
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                // final imageUrl = fetchImageCubit.state is FetchImageSuccess
                //     ? (fetchImageCubit.state as FetchImageSuccess).imageUrl
                //     : '';
                final imageUrl =
                    (fetchImageCubit.state as FetchImageSuccess).imageUrl;
                return RecipeDetailsWindow(
                  recipe: recipe,
                  index: index,
                  imageUrl: imageUrl,
                );
              },
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.transparent, // Set the card's color to transparent
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    // Add ClipRRect to clip the image
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ), // Match card's border radius
                    child: Center(
                      child: BlocBuilder<FetchImageCubit, FetchImageState>(
                        builder: (context, state) {
                          if (state is FetchImageInitial) {
                            // Trigger the cubit to fetch image when the card builds
                            context.read<FetchImageCubit>().fetchImage(
                              recipe.foodName,
                            );
                            return CircularProgressIndicator();
                          } else if (state is FetchImageLoading) {
                            return CircularProgressIndicator();
                          } else if (state is FetchImageSuccess) {
                            if (state.imageUrl.isNotEmpty) {
                              return Image.network(
                                state.imageUrl,
                                fit: BoxFit
                                    .cover, // Use BoxFit.cover to fill the space
                                width: double
                                    .infinity, // Ensure it takes full width
                                height: double
                                    .infinity, // Ensure it takes full height
                              );
                            } else {
                              return Icon(
                                Icons.image_not_supported,
                                size: 50,
                                color: Colors.grey[600],
                              );
                            }
                          } else if (state is FetchImageFailure) {
                            return Icon(
                              Icons.error,
                              size: 50,
                              color: Colors.red,
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text(
                        recipe.foodName,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        recipe.preparationTime,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(color: Colors.grey[600]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            recipe.difficulty,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          FavoriteButton(recipe: recipe),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
