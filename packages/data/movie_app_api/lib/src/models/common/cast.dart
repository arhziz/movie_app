import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'cast.g.dart';

///
@JsonSerializable()
class Cast extends BaseModel {
  ///
  const Cast({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.castId = 0,
    this.character = '',
    this.creditId = '',
    this.knownForDepartment = '',
    this.name = '',
    this.order = 0,
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
    super.typeString = 'cast',
  });

  ///
  final bool adult;

  ///
  final int gender;

  ///
  final int id;

  ///
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;

  ///
  final String name;

  ///
  @JsonKey(name: 'original_name')
  final String originalName;

  ///
  final double popularity;

  ///
  @JsonKey(name: 'profile_path')
  final String profilePath;

  ///
  @JsonKey(name: 'cast_id')
  final int castId;

  ///
  final String character;

  ///
  @JsonKey(name: 'credit_id')
  final String creditId;

  ///
  final int order;

  ///
  static const empty = Cast();

  ///
  static Cast fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() => _$CastToJson(this);
}
