import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'video.g.dart';

///
@JsonSerializable()
class Video extends BaseModel {
  ///
  const Video(
      {this.id = '',
      this.iso31661 = '',
      this.iso6391 = '',
      this.key = '',
      this.name = '',
      this.official = false,
      this.publishedAt = '',
      this.site = '',
      this.size = 0,
      this.type = '',
      super.typeString = 'video'});

  ///
  @JsonKey(name: 'iso_639_1')
  final String iso6391;

  ///
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;

  ///
  final String name;

  ///

  final String key;

  ///
  final String site;

  ///
  final int size;

  ///
  @JsonKey(name: 'type')
  final String type;

  ///
  final bool official;

  ///
  @JsonKey(name: 'published_at')
  final String publishedAt;

  ///
  final String id;

  ///
  static Video fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  @override
  List<Object?> get props => [
        id,
        key,
        iso31661,
        iso31661,
        official,
        publishedAt,
        type,
        size,
        site,
      ];

  @override
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
