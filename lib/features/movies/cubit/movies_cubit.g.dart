// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesState _$MoviesStateFromJson(Map<String, dynamic> json) => MoviesState(
      status: $enumDecodeNullable(_$MoviesStatusEnumMap, json['status']) ??
          MoviesStatus.initial,
      discoveredMovies: (json['discoveredMovies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentPage: (json['currentPage'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MoviesStateToJson(MoviesState instance) =>
    <String, dynamic>{
      'status': _$MoviesStatusEnumMap[instance.status]!,
      'discoveredMovies': instance.discoveredMovies,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
    };

const _$MoviesStatusEnumMap = {
  MoviesStatus.initial: 'initial',
  MoviesStatus.loading: 'loading',
  MoviesStatus.success: 'success',
  MoviesStatus.failure: 'failure',
};
