import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'crew.g.dart';

///
@JsonSerializable()
class Crew extends BaseModel {
  ///
  const Crew({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.department = '',
    this.creditId = '',
    this.knownForDepartment = '',
    this.name = '',
    this.job = '',
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
    super.typeString = 'crew',
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
  final String department;

  ///
  @JsonKey(name: 'credit_id')
  final String creditId;

  ///
  final String job;

  ///
  static const empty = Crew();

  ///
  static Crew fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  @override
  List<Object?> get props => [];

  @override
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
