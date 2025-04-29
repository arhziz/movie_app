import 'package:movie_app_api/movie_app_api.dart';

///@template_start movie_item
///The Abstraction of the movie api,
///@template_end
abstract class MoviesApi {
  ///@macro movie_api
  const MoviesApi();

  ///Gets the list of the movie objects
  ///returns collection of Movie objects
  Future<MovieResponse> dicoverMovies(DiscoverMoviesRequest request);

  ///gets the movie details
  ///takes in the movie id
  ///returns the movie object
  Future<Movie> getMovie(int id);

  ///Searchs movie by name only
  ///returns list of movie object
  Future<List<Movie>> searchMovie(String name);

  ///get the list of the genres
  ///returns collection of Genre objects
  Future<List<Genre>> getGenres();

  ///Closes the opened dio client
  Future<void> dispose();
}
