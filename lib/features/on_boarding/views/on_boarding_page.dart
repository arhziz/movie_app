import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:movie_app/features/on_boarding/views/views.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

/// @template on_boarding_page
/// OnBoardingPage widget
/// @endtemplate
class OnBoardingPage extends StatelessWidget {
  /// @macro on_boarding_page
  const OnBoardingPage({super.key});

  /// Creates a page for the [OnBoardingPage].
  static Page<void> page() => const MaterialPage<void>(child: OnBoardingPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc(
        context.read<MovieRepository>(),
        context.read<AuthenticationRepository>(),
      )..add(const OnBoardingGenresListRequested()),
      child: const Scaffold(
        body: SafeArea(
          child: OnBoardingView(),
        ),
      ),
    );
  }
}
