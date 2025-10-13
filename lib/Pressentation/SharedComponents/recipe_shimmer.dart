import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeShimmer extends StatelessWidget {
  const RecipeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget shimmerWidget = Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox.square(
        dimension: 200,
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [shimmerWidget, shimmerWidget],
      ),
    );
  }
}

class RecipeShimmerList extends StatelessWidget {
  const RecipeShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Material(
              borderRadius: BorderRadius.circular(16.0),
              elevation: 5,
              child: ListTile(
                // tileColor: kSecondaryColor.withValues(alpha: .2),
                title: Text(""),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10.0,
                  children: [
                    Text("", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("", style: TextStyle(color: Colors.grey[600])),
                    Text(""),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
