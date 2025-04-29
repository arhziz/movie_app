// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'MovieResponse',
      json,
      ($checkedConvert) {
        final val = MovieResponse(
          page: $checkedConvert('page', (v) => (v as num?)?.toInt() ?? 0),
          totalPages:
              $checkedConvert('total_pages', (v) => (v as num?)?.toInt() ?? 0),
          totalResults: $checkedConvert(
              'total_results', (v) => (v as num?)?.toInt() ?? 0),
          results: $checkedConvert(
              'results',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
                      .toList() ??
                  const []),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalPages': 'total_pages',
        'totalResults': 'total_results'
      },
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };
