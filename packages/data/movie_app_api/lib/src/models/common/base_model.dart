import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/src/models/models.dart';

///
abstract class BaseModel extends Equatable {
  ///
  const BaseModel({required this.typeString});

  /// The type of the app settings.
  @JsonKey(name: 'type_string')
  final String typeString;

  /// A method to convert the model to a map.
  Map<String, dynamic> toJson();

  ///
  static BaseModel fromJson(Map<String, dynamic> json) {
    switch (json['type_string']) {
      case 'user':
        return User.fromJson(json);
      case 'app_settings':
        return AppSettings.fromJson(json);
      case 'video':
        return Video.fromJson(json);
      case 'cast':
        return Cast.fromJson(json);
      case 'crew':
        return Crew.fromJson(json);
      default:
        throw UnsupportedError('Unknown type: ${json['type_string']}');
    }
  }
}
