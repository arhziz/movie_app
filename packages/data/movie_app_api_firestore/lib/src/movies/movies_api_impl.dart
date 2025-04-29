import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_api_firestore/src/common/common.dart';

///Exception is thrown when there is an error from the api
class ApiRequestFailure implements Exception {}

///Exception is thrown when there is no data from the api
class ApiResponseNotFound implements Exception {}

///All the utility methods for this object
class ObjectUtilities {
  ///Return the sortBy String for a movie
  static String getOrderByString({
    required SortBy sortBy,
    required bool isAscending,
  }) {
    var sortByString = '';
    var isAscendingString = '';
    if (isAscending) {
      isAscendingString = 'asc';
    } else {
      isAscendingString = 'desc';
    }

    switch (sortBy) {
      case SortBy.originalTitle:
        sortByString = 'original_title';
      case SortBy.popularity:
        sortByString = 'popularity';
      case SortBy.primaryReleaseDate:
        sortByString = 'primary_release_date';
      case SortBy.revenue:
        sortByString = 'revenue';
      case SortBy.title:
        sortByString = 'title';
      case SortBy.voteAverage:
        sortByString = 'vote_average';
      case SortBy.voteCount:
        sortByString = 'vote_count';
    }

    return '$sortByString.$isAscendingString';
  }
}

///@template_start movies_api_impl_item
///This Class Implements the movie api abstract class
///@template_end
class MoviesApiImpl extends MoviesApi {
  ///@macro movies_api_impl_item
  const MoviesApiImpl({required IHttpClient client}) : _client = client;

  final IHttpClient _client;

  @override
  Future<MovieResponse> dicoverMovies(DiscoverMoviesRequest request) async {
    final sortBy = ObjectUtilities.getOrderByString(
      sortBy: request.sortBy,
      isAscending: request.ascending,
    );
    final uri =
        // ignore: lines_longer_than_80_chars
        '${Urls.discoverMovies}?include_adult=false&include_video=${request.includeVideo}&language=${request.language}&page=${request.page}&sort_by=$sortBy';
    final response = await _client.getHttp(uri, authenticate: true);
    if (response.statusCode != 200) {
      throw ApiRequestFailure();
    }
    final jsonMap = response.data as JsonMap;
    if (!jsonMap.containsKey('results')) throw ApiResponseNotFound();

    final result = MovieResponse.fromJson(jsonMap);
    return result;
  }

  @override
  Future<Movie> getMovie(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovie(String name) {
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() async => _client.dispose();

  @override
  Future<List<Genre>> getGenres() async {
    final response = await _client.getHttp(
      Urls.getMovieGenres,
      authenticate: true,
    );
    if (response.statusCode != 200) {
      throw ApiRequestFailure();
    }
    final jsonMap = response.data as JsonMap;
    if (!jsonMap.containsKey('genres')) throw ApiResponseNotFound();
    final result = jsonMap['genres'] as List;
    final genres = result
        .map((genre) => Genre.fromJson(genre as JsonMap))
        .toList(growable: false);
    return genres;
  }
}
