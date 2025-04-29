import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'genre.g.dart';

///@template_start genre_item
///This the genre object
///This objects contains the genre details and all :)
///this is an immutable class
///it contains [toJson],[fromJson] static methods
///@template_end
@immutable
@JsonSerializable()
class Genre extends Equatable {
  ///@macro genre_item
  const Genre({
    this.id = 0,
    this.name = '',
  });

  ///
  final int id;

  ///
  final String name;

  /// Deserializes the given [JsonMap] into a [Genre].
  static Genre fromJson(JsonMap map) => _$GenreFromJson(map);

  /// Converts this [Genre] into a [JsonMap].
  JsonMap toJson() => _$GenreToJson(this);

  ///returns an empty object
  static const empty = Genre();

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
