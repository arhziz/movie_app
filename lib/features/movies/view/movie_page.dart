// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/movies/bloc/movie_bloc.dart';
import 'package:movie_app/features/movies/models/models.dart';
import 'package:movie_app/features/movies/view/views.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

///@template movies_page_item
///This is the movies view
///@endemplate
class MoviePage extends StatelessWidget {
  ///@macro movies_page_item
  const MoviePage({
    required this.movie,
    super.key,
  });

  ///
  final MovieModel movie;

  /// This method is used to create a page for the [MoviePage].
  static Page<void> page(MovieModel movie) => MaterialPage<void>(
        child: MoviePage(
          movie: movie,
        ),
      );

  /// This method is used to create a route for the [MoviePage].
  static Route<void> route(MovieModel movie) {
    return MaterialPageRoute<void>(
      builder: (_) => MoviePage(
        movie: movie,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(
            context.read<MovieRepository>(),
          )
            ..add(SetMovieModelEvent(movie))
            ..add(
              FetchMovieDetailEvent(id: movie.id),
            ),
        ),
      ],
      child: const MovieView(),
    );
  }
}
