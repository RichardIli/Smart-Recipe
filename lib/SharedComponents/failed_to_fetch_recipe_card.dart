import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FailedToFetchRecipeCard extends StatelessWidget {
  const FailedToFetchRecipeCard({
    super.key,
    required this.error,
    required this.refresh,
  });

  final String error;
  final void Function()? refresh;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(error);
    }
    return Center(
      child: SizedBox.square(
        dimension: 200,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: Theme.of(context).colorScheme.error,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'Oops! Something went wrong.',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              // const SizedBox(height: 8),
              // Text(
              //   error,
              //   style: Theme.of(context).textTheme.bodyMedium,
              //   textAlign: TextAlign.center,
              // ),
              const SizedBox(height: 16),
              refresh != null
                  ? ElevatedButton.icon(
                      onPressed: refresh,
                      icon: const Icon(Icons.refresh),
                      label: Text('Try Again'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Colors.white,
                      ),
                    )
                  : Text('Search Again'),
            ],
          ),
        ),
      ),
    );
  }
}
