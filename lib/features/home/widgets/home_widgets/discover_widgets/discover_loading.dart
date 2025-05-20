import 'package:flutter/material.dart';

/// A widget that displays a loading indicator for the movies page.
/// It shows a cloud emoji, a loading message, and a circular progress
/// indicator.
class DiscoverLoading extends StatelessWidget {
  /// Creates a [DiscoverLoading] widget.
  const DiscoverLoading({super.key});

  @override
  Widget build(BuildContext context) {
    //final theme = Theme.of(context);
    return const Center(
      child: Column(
        children: [
          //Text('🎬', style: TextStyle(fontSize: 20)),
          SizedBox(
            height: 40,
            width: 40,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
