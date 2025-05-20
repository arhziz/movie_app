import 'package:flutter/material.dart';
import 'package:movie_app/shared/shared.dart';
import 'package:movie_app_api/movie_app_api.dart' show Movie;

///@template movies_success
///This is the movies success view
///@endemplate
class DiscoverSuccess extends StatelessWidget {
  ///@macro movies_success
  ///This is the movies success view
  const DiscoverSuccess({required this.discoverMovies, super.key});

  ///The list of movies
  final List<Movie> discoverMovies;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: discoverMovies
          .map(
            (movie) => MovieCardBigWidget(
              movie: movie,
            ),
          )
          .toList(),
    );
  }
}
