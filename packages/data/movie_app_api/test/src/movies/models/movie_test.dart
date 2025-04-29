// ignore_for_file: lines_longer_than_80_chars

import 'package:movie_app_api/movie_app_api.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Movie',
    () {
      group(
        'fromJson',
        () {
          test(
            'returns correct Movie object',
            () {
              expect(
                Movie.fromJson(
                  <String, dynamic>{
                    'backdrop_path': '/op3qmNhvwEvyT7UFyPbIfQmKriB.jpg',
                    'genre_ids': [14, 12, 28],
                    'id': 324544,
                    'default_language': 'en',
                    'overview':
                        'A queen sends the powerful and feared sorceress Gray Alys to the ghostly wilderness of the Lost Lands in search of a magical power, where the sorceress and her guide, the drifter Boyce must outwit and outfight man and demon.',
                    'popularity': 873.5678,
                    'poster_path': '/iHf6bXPghWB6gT8kFkL1zo00x6X.jpg',
                    'release_date': '2025-02-27',
                    'title': 'In the Lost Lands',
                    'video': false,
                    'vote_average': 6.1,
                    'vote_count': 111,
                  },
                ),
                isA<Movie>()
                    .having((w) => w.id, 'id', 324544)
                    .having((w) => w.genreIds.length, 'genre_ids count', 3)
                    .having((w) => w.genreIds[0], 'genre_ids[0]', 14)
                    .having(
                      (w) => w.backdropPath,
                      'backdrop_path',
                      '/op3qmNhvwEvyT7UFyPbIfQmKriB.jpg',
                    )
                    .having((w) => w.defaultLanguage, 'default_language', 'en')
                    .having((w) => w.overview, 'overview',
                        'A queen sends the powerful and feared sorceress Gray Alys to the ghostly wilderness of the Lost Lands in search of a magical power, where the sorceress and her guide, the drifter Boyce must outwit and outfight man and demon.',)
                    .having((w) => w.popularity, 'popularity', 873.5678)
                    .having((w) => w.posterPath, 'poster_path',
                        '/iHf6bXPghWB6gT8kFkL1zo00x6X.jpg',)
                    .having((w) => w.releaseDate, 'release_date', '2025-02-27')
                    .having((w) => w.title, 'title', 'In the Lost Lands')
                    .having((w) => w.video, 'video', false)
                    .having((w) => w.voteAverage, 'vote_average', 6.1)
                    .having((w) => w.voteCount, 'vote_count', 111),
              );
            },
          );
        },
      );
    },
  );
}
