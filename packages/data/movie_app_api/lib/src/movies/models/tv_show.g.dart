// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'tv_show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvShow _$TvShowFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TvShow',
      json,
      ($checkedConvert) {
        final val = TvShow(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt() ?? 0),
          backdropPath:
              $checkedConvert('backdrop_path', (v) => v as String? ?? ''),
          defaultLanguage:
              $checkedConvert('default_language', (v) => v as String? ?? ''),
          genreIds: $checkedConvert(
              'genre_ids',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => (e as num).toInt())
                      .toList() ??
                  const []),
          originCountry: $checkedConvert(
              'origin_country',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const []),
          overview: $checkedConvert('overview', (v) => v as String? ?? ''),
          popularity: $checkedConvert(
              'popularity', (v) => (v as num?)?.toDouble() ?? 0),
          posterPath: $checkedConvert('poster_path', (v) => v as String? ?? ''),
          releaseDate:
              $checkedConvert('release_date', (v) => v as String? ?? ''),
          firstAirdate:
              $checkedConvert('first_airdate', (v) => v as String? ?? ''),
          title: $checkedConvert('title', (v) => v as String? ?? ''),
          video: $checkedConvert('video', (v) => v as bool? ?? false),
          voteAverage: $checkedConvert(
              'vote_average', (v) => (v as num?)?.toDouble() ?? 0),
          voteCount: $checkedConvert(
              'vote_count', (v) => (v as num?)?.toDouble() ?? 0),
        );
        return val;
      },
      fieldKeyMap: const {
        'backdropPath': 'backdrop_path',
        'defaultLanguage': 'default_language',
        'genreIds': 'genre_ids',
        'originCountry': 'origin_country',
        'posterPath': 'poster_path',
        'releaseDate': 'release_date',
        'firstAirdate': 'first_airdate',
        'voteAverage': 'vote_average',
        'voteCount': 'vote_count'
      },
    );

Map<String, dynamic> _$TvShowToJson(TvShow instance) => <String, dynamic>{
      'id': instance.id,
      'genre_ids': instance.genreIds,
      'origin_country': instance.originCountry,
      'backdrop_path': instance.backdropPath,
      'default_language': instance.defaultLanguage,
      'title': instance.title,
      'poster_path': instance.posterPath,
      'video': instance.video,
      'popularity': instance.popularity,
      'release_date': instance.releaseDate,
      'first_airdate': instance.firstAirdate,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
