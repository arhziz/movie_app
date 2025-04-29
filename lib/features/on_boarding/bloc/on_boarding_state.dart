part of 'on_boarding_bloc.dart';

/// @template on_boarding_state
/// OnBoardingState class
/// @endtemplate
enum OnBoardingStatus {
  /// The initial state of the Onboarding process.
  initial,

  /// The state when the Onboarding process is in progress.
  loading,

  /// The state when the Onboarding process is completed successfully.
  success,

  /// The state when the Onboarding process has failed.
  failure,

  /// The state when the Onboarding process is completed.
  completed,
}

/// OnBoardingState class
/// This class represents the state of the Onboarding process.
final class OnBoardingState extends Equatable {
  /// Creates an instance of OnboardingState.
  const OnBoardingState({
    this.genresList = const [],
    this.selectedGenres = const [],
    this.status = OnBoardingStatus.initial,
  });

  /// The list of genres available for selection.
  /// This is a list of strings representing the genres.
  final List<Genre> genresList;

  /// The list of selected genres by the user.
  final List<Genre> selectedGenres;

  /// The current status of the Onboarding process.
  final OnBoardingStatus status;

  /// Creates a copy of the current state with the updated values.
  /// This method is used to create a new instance of the state
  /// with the updated values.
  /// @param genresList The updated list of genres.
  /// @param selectedGenres The updated list of selected genres.
  /// @param status The updated status of the Onboarding process.
  OnBoardingState copyWith({
    List<Genre>? genresList,
    List<Genre>? selectedGenres,
    OnBoardingStatus? status,
  }) {
    return OnBoardingState(
      genresList: genresList ?? this.genresList,
      selectedGenres: selectedGenres ?? this.selectedGenres,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        genresList,
        selectedGenres,
        status,
      ];
}
