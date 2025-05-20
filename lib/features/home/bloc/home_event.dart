part of 'home_bloc.dart';

///
final class HomeEvent extends Equatable {
  ///
  const HomeEvent();

  @override
  List<Object> get props => [];
}

///
final class HomeFetchDiscoverEvent extends HomeEvent {
  ///
  const HomeFetchDiscoverEvent();
}

/// MovieGenres event
/// This event is triggered when the user requests to get the list of movie
/// genres.
/// This event is used to fetch the list of genres from the API.
final class GenresListRequested extends HomeEvent {
  /// Creates an instance of GetMovieGenres event.
  const GenresListRequested();
}
