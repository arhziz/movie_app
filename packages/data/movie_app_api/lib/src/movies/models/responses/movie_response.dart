import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api/src/models/models.dart';
import 'package:movie_app_api/src/movies/models/models.dart';

part 'movie_response.g.dart';

///@template_start movie_response_item
///@template_end
@immutable
@JsonSerializable()
class MovieResponse extends Response {
  ///@macro movie_response_item
  const MovieResponse({
    super.page,
    super.totalPages,
    super.totalResults,
    this.results = const [],
  });

  ///list of the response object
  final List<Movie> results;

  ///returns an empty object
  static const empty = MovieResponse();

  /// Deserializes the given [JsonMap] into a [MovieResponse].
  static MovieResponse fromJson(JsonMap map) => _$MovieResponseFromJson(map);

  /// Converts this [Movie] into a [JsonMap].
  JsonMap toJson() => _$MovieResponseToJson(this);

  @override
  List<Object?> get props => [results, page, totalPages, totalResults];
}
