// ignore_for_file: lines_longer_than_80_chars

import 'package:movie_app_api/movie_app_api.dart';
import 'package:test/test.dart';

void main() {
  group(
    'MovieResponse',
    () {
      group(
        'fromJson',
        () {
          test(
            'returns correct MovieResponse object',
            () {
              expect(
                MovieResponse.fromJson(
                  <String, dynamic>{
                    'page': 1,
                    'results': [
                      {
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
                      {
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
                    ],
                    'total_pages': 1000,
                    'total_results': 20000,
                  },
                ),
                isA<MovieResponse>()
                    .having((w) => w.page, 'page', 1)
                    .having((w) => w.results.length, 'result', 2)
                    .having((w) => w.totalPages, 'total_pages', 1000)
                    .having((w) => w.totalResults, 'total_results', 20000),
              );
            },
          );
        },
      );
    },
  );
}
