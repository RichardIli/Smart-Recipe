
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeShimmer extends StatelessWidget {
  const RecipeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox.square(
        dimension: 300,
        child: Card(
          color: Colors.white,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Loading Daily Inspiration...",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
    );
  }
}
