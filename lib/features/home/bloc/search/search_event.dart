part of 'search_bloc.dart';

/// SearchEvent
abstract class SearchEvent extends Equatable {
  /// SearchEvent
  /// This is the base class for all search events.
  const SearchEvent();

  @override
  List<Object> get props => [];
}

/// SearchQueryChanged
/// This event is triggered when the search query changes.
class SearchQueryChanged extends SearchEvent {
  /// SearchQueryChanged
  const SearchQueryChanged(this.query);

  ///
  final String query;
}

/// SearchFocusChanged
/// This event is triggered when the search focus changes.
class SearchFocusChanged extends SearchEvent {
  /// SearchFocusChanged
  const SearchFocusChanged({required this.isFocused});

  /// isFocused
  final bool isFocused;

  @override
  List<Object> get props => [isFocused];
}

///
class SearchLoadMoreEvent extends SearchEvent {
  /// SearchLoadMoreEvent
  const SearchLoadMoreEvent();

  @override
  List<Object> get props => [];
}
