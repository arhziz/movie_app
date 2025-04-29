import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'tv_show.g.dart';

///@template_start tv_show_item
///This the tv_show object
///This objects contains the movie details and all :)
///this is an immutable class
///it contains [toJson],[fromJson] static methods
///@template_end
@immutable
@JsonSerializable()
class TvShow extends Equatable {
  ///@macro movie_item
  const TvShow({
    this.id = 0,
    this.backdropPath = '',
    this.defaultLanguage = '',
    this.genreIds = const [],
    this.originCountry = const [],
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.releaseDate = '',
    this.firstAirdate = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  ///
  final int id;

  ///
  final List<int> genreIds;

  ///
  final List<String> originCountry;

  ///
  final String backdropPath;

  ///
  final String defaultLanguage;

  ///
  final String title;

  ///
  final String posterPath;

  ///
  final bool video;

  ///
  final double popularity;

  ///
  final String releaseDate;

  ///
  final String firstAirdate;

  ///
  final String overview;

  ///
  final double voteAverage;

  ///
  final double voteCount;

  /// Deserializes the given [JsonMap] into a [TvShow].
  static TvShow fromJson(JsonMap map) => _$TvShowFromJson(map);

  /// Converts this [TvShow] into a [JsonMap].
  JsonMap toJson() => _$TvShowToJson(this);

  ///returns an empty object
  static const empty = TvShow();

  @override
  List<Object?> get props => [id, title, overview, releaseDate, originCountry];
}
