import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/shared/shared.dart';
import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

/// SearchBloc
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  /// SearchBloc
  SearchBloc(this._movieRepository) : super(const SearchState()) {
    focusNode.addListener(() {
      //   emit(
      //     state.copyWith(
      //       isFocused: focusNode.hasFocus,
      //     ),
      //   );
      add(
        SearchFocusChanged(isFocused: focusNode.hasFocus),
      );
    });
    on<SearchFocusChanged>(_onSearchFocusChanged);
    on<SearchQueryChanged>(_onSearchQueryChanged);
  }

  /// debouncer
  /// This is used to debounce the search query input.
  final Debouncer debouncer = Debouncer();

  /// focusNode
  final FocusNode focusNode = FocusNode();

  final MovieRepository _movieRepository;

  FutureOr<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    debouncer.run(() async {
      emit(state.copyWith(status: SearchStatus.loading));

      try {
        final result = await _movieRepository.searchMovie(
          event.query,
        );
        emit(
          state.copyWith(
            status: SearchStatus.success,
            movies: result.results,
          ),
        );
      } on Exception catch (e) {
        emit(state.copyWith(status: SearchStatus.failure));
      }
    });
  }

  @override
  Future<void> close() {
    //focusNode.dispose();
    debouncer.dispose();
    return super.close();
  }

  FutureOr<void> _onSearchFocusChanged(
    SearchFocusChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(isFocused: event.isFocused));
  }
}
