// ignore_for_file: public_member_api_docs

class Urls {
  static const String discoverMovies =
      'https://api.themoviedb.org/3/discover/movie';
  static const String getMovieGenres =
      'https://api.themoviedb.org/3/genre/movie/list?language=en';

  static const String getMovieDetails = 'https://api.themoviedb.org/3/movie/';

  static String searchMovies(String query) {
    // Encode the query string to make it URL-safe
    final encodedQuery = Uri.encodeQueryComponent(query);
    // Return the complete search URL with the encoded query
    return 'https://api.themoviedb.org/3/search/movie?language=en-US&include_adult=false&query=$encodedQuery';
  }
}
