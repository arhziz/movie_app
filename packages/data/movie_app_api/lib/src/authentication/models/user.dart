import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_api/src/models/models.dart';

part 'user.g.dart';

///@template_start user_item
///This the user object
///@template_end
@immutable
@JsonSerializable()
class User extends Equatable {
  ///@macro user_item
  const User({
    this.email = '',
    this.country = '',
    this.fullName = '',
    this.phoneNumber = '',
  });

  ///the email field
  ///cannot be null
  ///default value = ''
  final String email;

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

  ///returns the empty object
  static const empty = User();

  /// Deserializes the given [JsonMap] into a [User].
  static User fromJson(JsonMap json) => _$UserFromJson(json);

  /// Converts this [User] into a [JsonMap].
  JsonMap toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [];
}
