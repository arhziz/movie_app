import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'movie.g.dart';

///@template_start movie_item
///This the movie object
///This objects contains the movie details and all :)
///this is an immutable class
///it contains [toJson],[fromJson] static methods
///@template_end
@immutable
@JsonSerializable()
class Movie extends Equatable {
  ///@macro movie_item
  const Movie({
    this.id = 0,
    this.backdropPath = '',
    this.defaultLanguage = '',
    this.genreIds = const [],
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.releaseDate = '',
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
  final String overview;

  ///
  final double voteAverage;

  ///
  final double voteCount;

  /// Deserializes the given [JsonMap] into a [Movie].
  static Movie fromJson(JsonMap map) => _$MovieFromJson(map);

  /// Converts this [Movie] into a [JsonMap].
  JsonMap toJson() => _$MovieToJson(this);

  ///returns an empty object
  static const empty = Movie();

  @override
  List<Object?> get props => [id, title, overview, releaseDate];
}
