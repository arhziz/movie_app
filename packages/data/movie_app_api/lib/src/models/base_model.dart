import 'package:equatable/equatable.dart';
import 'package:movie_app_api/src/models/models.dart';

abstract class BaseModel  extends Equatable {
  const BaseModel();
  /// A method to convert the model to a map.
  Map<String, dynamic> toJson();

   static BaseModel fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'user':
        return User.fromJson(json);
      case 'app_settings':
        return AppSettings.fromJson(json);
      default:
        throw UnsupportedError('Unknown type: ${json['type']}');
    }
  }
}