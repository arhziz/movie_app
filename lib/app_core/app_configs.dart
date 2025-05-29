// ignore_for_file: public_member_api_docs

import 'package:movie_app_api/movie_app_api.dart';

class AppConfigs {
  static String preMovieBackdrop(String path) =>
      'https://image.tmdb.org/t/p/w780$path';

  static String preMoviePoster(String path) =>
      'https://image.tmdb.org/t/p/w500$path';

  static String preCastProfilePath(String path) =>
      'https://image.tmdb.org/t/p/w185$path';

  static String youtubeThumbnail(String key) =>
      'https://img.youtube.com/vi/$key/0.jpg';

  static String youtubeVideo(String key) =>
      'https://www.youtube.com/watch?v=$key';

  static String imdbMovie(String id) => 'https://www.imdb.com/title/$id';

  static String wikipediaMovie(String title) {
    // Replace spaces with underscores for the URL
    final formattedTitle = title.replaceAll(' ', '_');
    // Return the Wikipedia URL for the movie
    return 'https://en.wikipedia.org/wiki/$formattedTitle';
  }

  static String wikipediaPerson(String name) {
    // Replace spaces with underscores for the URL
    final formattedName = name.replaceAll(' ', '_');
    // Return the Wikipedia URL for the person
    return 'https://en.wikipedia.org/wiki/$formattedName';
  }

  static const int shouldCachePages = 1;

  static String getMovieGenresString({
    required List<Genre> allGenres,
    required List<int> movieGenreIds,
  }) {
    // Create a map for fast lookup: { id: name }
    final genreMap = {for (final genre in allGenres) genre.id: genre.name};

    // Build the list of genre names matching the movieGenreIds
    final genreNames = movieGenreIds
        .where(genreMap.containsKey)
        .map((id) => genreMap[id])
        .toList();

    return genreNames.join(' • ');
  }

  static String getGenresString({
    required List<Genre> allGenres,
  }) {
    final theNames = allGenres.map((gen) => gen.name).toList();
    return theNames.join(' • ');
  }
}
