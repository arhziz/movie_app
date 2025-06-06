// ignore_for_file: inference_failure_on_instance_creation

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

/// SearchBloc
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  /// SearchBloc
  SearchBloc(this._movieRepository) : super(const SearchState()) {
    focusNode.addListener(() {
      add(
        SearchFocusChanged(isFocused: focusNode.hasFocus),
      );
    });
    on<SearchFocusChanged>(_onSearchFocusChanged);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SearchLoadMoreEvent>(_onSearchLoadMoreEvent);
  }

  /// focusNode
  final FocusNode focusNode = FocusNode();

  final MovieRepository _movieRepository;

  FutureOr<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: SearchStatus.loading));

    try {
      final result = await _movieRepository.searchMovie(
        event.query,
      );
      emit(
        state.copyWith(
          status: SearchStatus.success,
          searchQuery: event.query,
          movies: result.results,
          totalResults: result.totalResults,
          totalPages: result.totalPages,
          currentPage: result.page,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Search error: $e');
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }

  @override
  Future<void> close() {
    focusNode.dispose();

    return super.close();
  }

  FutureOr<void> _onSearchFocusChanged(
    SearchFocusChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(isFocused: event.isFocused));
    await Future.delayed(const Duration(milliseconds: 300));
    // if (event.isFocused) {
    //   focusNode.unfocus();
    // }
    // emit(const SearchState());
  }

  FutureOr<void> _onSearchLoadMoreEvent(
    SearchLoadMoreEvent event,
    Emitter<SearchState> emit,
  ) async {
    if (state.currentPage >= state.totalPages) {
      return;
    }
    emit(state.copyWith(status: SearchStatus.loadingMore));
    try {
      final result = await _movieRepository.searchMovie(
        state.searchQuery,
        page: state.currentPage + 1,
      );
      emit(
        state.copyWith(
          status: SearchStatus.success,
          movies: [...state.movies, ...result.results],
          totalResults: result.totalResults,
          totalPages: result.totalPages,
          currentPage: result.page,
        ),
      );
    } on Exception catch (e) {
      debugPrint('Search error: $e');
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
