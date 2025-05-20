import 'package:flutter/material.dart';

///@template movies_empty_item
///This is the movies empty view
///@endemplate
class DiscoverEmpty extends StatelessWidget {
  ///@macro movies_empty_item
  const DiscoverEmpty({
    required this.loadMovies,
    super.key,
  });

  ///The function to load movies
  ///@param loadMovies the function to load movies
  final VoidCallback loadMovies;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Whole a lot of nothing',
          style: theme.textTheme.headlineSmall?.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Looks like there are no movies to show',
          style: theme.textTheme.bodyLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: loadMovies,
          child: const Text(
            'Load Movies',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
