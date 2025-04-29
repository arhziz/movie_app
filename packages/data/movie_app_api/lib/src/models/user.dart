import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'user.g.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
@JsonSerializable()
class User extends BaseModel {
  /// {@macro user}
  const User({
    required this.id,
    this.email = '',
    this.country = '',
    this.fullName = '',
    this.phoneNumber = '',
    this.name = '',
    this.photo = '',
    // ignore: avoid_field_initializers_in_const_classes
  }) : type = 'user';

  /// The current user's email address.
  final String email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String name;

  /// Url for the current user's photo.
  final String photo;

  ///the full name field
  ///cannot be null
  ///default value = ''
  final String fullName;

  ///the phone number field
  ///cannot be null
  ///default value = ''
  final String phoneNumber;

  ///the country field
  ///cannot be null
  ///default value = ''
  final String country;

  /// The type of the user.
  /// This is used to identify the type of the model when deserializing.
  /// It is set to 'user' for the [User] model.
  final String type;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Creates a new [User] instance from a JSON map.
  static User fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Converts the [User] instance to a JSON map.
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [email, id, name, photo];
}
