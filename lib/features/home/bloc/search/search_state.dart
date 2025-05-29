part of 'search_bloc.dart';

///
enum SearchStatus {
  /// The initial state
  initial,

  /// The loading state
  loading,

  /// The success state
  success,

  /// The failure state
  failure,
}

/// The state of the search feature
/// This class holds the status of the search operation and the list of movies
final class SearchState extends Equatable {
  /// The constructor for the SearchState class
  const SearchState({
    this.status = SearchStatus.initial,
    this.movies = const [],
    this.searchQuery = '',
    this.isFocused = false,
  });

  /// status of the search operation
  final SearchStatus status;

  /// The list of movies returned from the search operation
  final List<Movie> movies;

  ///
  final String searchQuery;

  /// Indicates whether the search input field is focused
  final bool isFocused;

  /// Creates a copy of the current state with the given status.
  /// The [status] parameter is required and represents the status of the
  /// search operation.
  SearchState copyWith({
    SearchStatus? status,
    List<Movie>? movies,
    String? searchQuery,
    bool? isFocused,
  }) {
    return SearchState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      searchQuery: searchQuery ?? this.searchQuery,
      isFocused: isFocused ?? this.isFocused,
    );
  }

  @override
  List<Object> get props => [searchQuery, status, movies, isFocused];
}
