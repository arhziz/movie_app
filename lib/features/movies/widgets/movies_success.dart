import 'package:flutter/material.dart';
import 'package:movie_app_api/movie_app_api.dart' show Movie;

///@template movies_success
///This is the movies success view
///@endemplate
class MoviesSuccess extends StatelessWidget {
  ///@macro movies_success
  ///This is the movies success view
  const MoviesSuccess({required this.discoverMovies, super.key});

  ///The list of movies
  final List<Movie> discoverMovies;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: discoverMovies.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final movie = discoverMovies[index];
        return ListTile(
          title: Text(movie.title),
          subtitle: Text(movie.overview),
        );
      },
    );
  }
}
