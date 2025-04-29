import 'package:flutter/material.dart';

/// A widget that displays a loading indicator for the movies page.
/// It shows a cloud emoji, a loading message, and a circular progress indicator.
class MoviesLoading extends StatelessWidget {
  /// Creates a [MoviesLoading] widget.
  const MoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('🎬', style: TextStyle(fontSize: 64)),
        Text(
          'Loading',
          style: theme.textTheme.headlineSmall,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}