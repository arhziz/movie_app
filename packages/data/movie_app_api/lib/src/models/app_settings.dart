import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/movie_app_api.dart';

part 'app_settings.g.dart';

/// {@template app_settings}
/// AppSettings model
///
/// [AppSettings.empty] represents an unauthenticated user.
/// {@endtemplate}
@JsonSerializable()
class AppSettings extends BaseModel {
  /// {@macro app_settings}
  const AppSettings({
    this.hasSeenOnboarding = false,
    this.selectedGenres = const [],
  }) : type = 'app_settings';

  /// The current user's onboarding status.
  final bool hasSeenOnboarding;

  /// The list of genres selected by the user.
  /// This is a list of [Genre] objects representing the genres.
  /// This list is used to filter the movies displayed to the user.
  final List<Genre> selectedGenres;

  final String type;

  /// Empty app settings which represents an unauthenticated user.
  static const empty = AppSettings();

  /// Creates a copy of the current app settings with the updated values.
  /// This method is used to create a new instance of the app settings
  /// with the updated values.
  /// @param hasSeenOnboarding The updated onboarding status.
  /// @param selectedGenres The updated list of selected genres.
  AppSettings copyWith({
    bool? hasSeenOnboarding,
    List<Genre>? selectedGenres,
  }) {
    return AppSettings(
      hasSeenOnboarding: hasSeenOnboarding ?? this.hasSeenOnboarding,
      selectedGenres: selectedGenres ?? this.selectedGenres,
    );
  }

  @override
  List<Object?> get props => [
        hasSeenOnboarding,
        selectedGenres,
      ];

  /// Creates a new [AppSettings] instance from a JSON map.
  /// This method is used to deserialize the JSON map into an
  /// [AppSettings] object.
  /// @param json The JSON map to deserialize.
  ///   @return A new [AppSettings] instance.
  static AppSettings fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);
}
