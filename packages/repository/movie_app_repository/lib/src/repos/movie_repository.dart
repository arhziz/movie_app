import 'package:movie_app_api/movie_app_api.dart';

///@template movie_repository_item
///The repository for moives
///@endtemplate
class MovieRepository {
  ///@macro movie_repository_item
  const MovieRepository({required MoviesApi moviesApi})
      : _moviesApi = moviesApi;

  ///api reference tp the movies api
  final MoviesApi _moviesApi;

  ///calls the discover movies method
  Future<MovieResponse> discoverMovies(DiscoverMoviesRequest request) async =>
      _moviesApi.dicoverMovies(request);

  ///
  Future<MovieDetail> getMovieDetail(int id) async => _moviesApi.getMovie(id);

  ///calls the get genre method
  Future<List<Genre>> getGenres() async => _moviesApi.getGenres();

  ///Closes the opened httpclient
  Future<void> close() async => _moviesApi.dispose();
}
