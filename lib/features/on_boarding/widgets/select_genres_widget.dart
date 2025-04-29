import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:movie_app/features/on_boarding/widgets/genres_get_success_widget.dart';

///select_genres_widget.dart
/// This widget is used to select genres during the onboarding process.
/// It displays a list of genres and allows the user to select their
/// preferred genres.
class SelectGenresWidget extends StatelessWidget {
  /// Creates an instance of [SelectGenresWidget].
  const SelectGenresWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
      builder: (context, state) {
        switch (state.status) {
          case OnBoardingStatus.initial:
            return const Center(
              child: Text('Select your favorite genres'),
            );
          case OnBoardingStatus.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case OnBoardingStatus.failure:
            return const Center(
              child: Text('Failed to load genres'),
            );
          case OnBoardingStatus.success:
            return GenresGetSuccessWidget(genresList: state.genresList);
          case OnBoardingStatus.completed:
            return const Center(
              child: Text('Onboarding completed'),
            );
        }
      },
    );
  }
}
