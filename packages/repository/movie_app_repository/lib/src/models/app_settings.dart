import 'package:equatable/equatable.dart';
import 'package:movie_app_api/movie_app_api.dart';

/// {@template app_settings}
/// AppSettings model
///
/// [AppSettings.empty] represents an unauthenticated user.
/// {@endtemplate}
class AppSettings extends Equatable {
  /// {@macro app_settings}
  const AppSettings({
    this.hasSeenOnboarding = false,
    this.selectedGenres = const [],
  });

  /// The current user's onboarding status.
  final bool hasSeenOnboarding;

  /// The list of genres selected by the user.
  /// This is a list of [Genre] objects representing the genres.
  /// This list is used to filter the movies displayed to the user.
  final List<Genre> selectedGenres;

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
}
