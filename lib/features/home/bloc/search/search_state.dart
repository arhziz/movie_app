part of 'search_bloc.dart';

///
enum SearchStatus {
  /// The initial state
  initial,

  /// The loading state
  loading,

  /// Loading more results
  loadingMore,

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
    this.currentPage = 1,
    this.totalResults = 0,
    this.totalPages = 0,
  });

  /// status of the search operation
  final SearchStatus status;

  /// The list of movies returned from the search operation
  final List<Movie> movies;

  ///
  final String searchQuery;

  /// Indicates whether the search input field is focused
  final bool isFocused;

  ///
  /// The current page of the search results
  final int currentPage;

  /// The total number of results returned from the search operation
  final int totalResults;

  /// The total number of pages of results returned from the search operation
  final int totalPages;

  /// Creates a copy of the current state with the given status.
  /// The [status] parameter is required and represents the status of the
  /// search operation.
  SearchState copyWith({
    SearchStatus? status,
    List<Movie>? movies,
    String? searchQuery,
    bool? isFocused,
    int? currentPage,
    int? totalResults,
    int? totalPages,
  }) {
    return SearchState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      searchQuery: searchQuery ?? this.searchQuery,
      isFocused: isFocused ?? this.isFocused,
      currentPage: currentPage ?? this.currentPage,
      totalResults: totalResults ?? this.totalResults,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [searchQuery, status, movies, isFocused];
}
