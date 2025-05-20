import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/widgets/widgets.dart';

///
class MovieView extends StatelessWidget {
  /// Creates a [MovieView] widget.
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        return switch (state.status) {
          MoviesStatus.initial => const MovieLoadingWidget(),
          MoviesStatus.loading => const MovieLoadingWidget(),
          MoviesStatus.success => MovieSuccessWidget(movie: state.movie),
          MoviesStatus.failure => const MovieLoadingWidget(isError: true),
        };
      },
    );
  }
}
