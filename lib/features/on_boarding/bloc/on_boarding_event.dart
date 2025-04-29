part of 'on_boarding_bloc.dart';

/// @template on_boarding_event
/// OnBoardingEvent class
/// This class represents the events that can occur in the Onboarding process.
/// @endtemplate
sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object> get props => [];
}

/// OnBoardingGetMovieGenres event
/// This event is triggered when the user requests to get the list of movie
/// genres.
/// This event is used to fetch the list of genres from the API.
/// It is used to populate the genres list in the Onboarding process.
class OnBoardingGenresListRequested extends OnBoardingEvent {
  /// Creates an instance of OnBoardingGetMovieGenres event.
  const OnBoardingGenresListRequested();
}

class OnBoardingGenresSelected extends OnBoardingEvent {
  /// Creates an instance of OnBoardingGenresSelected event.
  const OnBoardingGenresSelected(this.selectedGenre);

  /// The list of selected genres by the user.
  final Genre selectedGenre;

  @override
  List<Object> get props => [selectedGenre];
}

/// OnBoardingCompleted event
/// This event is triggered when the user completes the Onboarding process.
/// This event is used to save the selected genres and complete the Onboarding
/// process.
/// It is used to navigate to the home screen of the app.
class OnBoardingCompleted extends OnBoardingEvent {
  /// Creates an instance of OnBoardingCompleted event.
  const OnBoardingCompleted();

  @override
  List<Object> get props => [];
}
