import 'package:flutter/material.dart';

/// A widget that displays an error message when something goes wrong.
/// This widget shows an emoji and a message indicating that something
/// went wrong.
class DiscoverError extends StatelessWidget {
  /// Creates a [DiscoverError] widget.
  /// This widget is used to display an error message when something goes wrong.
  const DiscoverError({required this.loadMovies, super.key});

  ///The function to load movies
  ///@param loadMovies the function to load movies
  final VoidCallback loadMovies;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 64)),
        Text(
          'Something went wrong!',
          style: theme.textTheme.headlineSmall,
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
