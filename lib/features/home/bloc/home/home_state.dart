part of 'home_bloc.dart';

///
enum DiscoverStatus {
  ///
  initial,

  ///
  loading,

  ///
  success,

  ///
  failure,
}

///
enum GenreStatus {
  ///
  initial,

  ///
  loading,

  ///
  success,

  ///
  failure,
}

///
final class HomeState extends Equatable {
  ///
  const HomeState({
    this.status = DiscoverStatus.initial,
    this.genreStatus = GenreStatus.initial,
    this.discoveredMovies = const [],
    this.genresList = const [],
    this.currentPage = 0,
    this.totalPages = 0,
  });

  ///
  final DiscoverStatus status;

  ///
  final GenreStatus genreStatus;

  ///
  final List<Movie> discoveredMovies;

  /// The list of genres available for selection.
  /// This is a list of strings representing the genres.
  final List<Genre> genresList;

  ///
  final int currentPage;

  ///
  final int totalPages;

  ///
  HomeState copyWith({
    DiscoverStatus? status,
    GenreStatus? genreStatus,
    List<Movie>? discoveredMovies,
    List<Genre>? genresList,
    int? currentPage,
    int? totalPages,
  }) =>
      HomeState(
        status: status ?? this.status,
        genreStatus: genreStatus ?? this.genreStatus,
        genresList: genresList ?? this.genresList,
        discoveredMovies: discoveredMovies ?? this.discoveredMovies,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
      );

  @override
  List<Object> get props => [
        status,
        discoveredMovies,
        currentPage,
        totalPages,
      ];
}
