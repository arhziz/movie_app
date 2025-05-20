import 'package:flutter/material.dart';
import 'package:movie_app/app_core/app_core.dart';

/// This widget is a placeholder for the MovieView.
/// It shows a loading indicator or an error message based on the state.
class MovieLoadingWidget extends StatelessWidget {
  /// Creates a [MovieLoadingWidget] widget.
  /// If [isError] is true, it shows an error message.
  const MovieLoadingWidget({this.isError = false, super.key});

  /// Indicates whether an error occurred while loading the movie.
  /// If true, an error message will be displayed.
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.moviesBackgroundColor,
      body: Center(
        child: isError
            ? const Text('Error loading movie')
            : const SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
