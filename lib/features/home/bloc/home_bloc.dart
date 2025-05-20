import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

///
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ///
  HomeBloc(this._movieRepository) : super(const HomeState()) {
    on<HomeFetchDiscoverEvent>(_homeFetchDiscoverEvent);
    on<GenresListRequested>(_onGenresListRequested);
  }

  final MovieRepository _movieRepository;

  FutureOr<void> _homeFetchDiscoverEvent(
    HomeFetchDiscoverEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: DiscoverStatus.loading));
    try {
      final result = await _movieRepository.discoverMovies(
        DiscoverMoviesRequest(
          page: state.currentPage < state.totalPages
              ? state.currentPage + 2
              : state.totalPages == 0
                  ? state.currentPage + 2
                  : state.currentPage,
        ),
      );
      final genreResult = await _movieRepository.getGenres();
      emit(
        state.copyWith(
          status: DiscoverStatus.success,
          genresList: genreResult,
          discoveredMovies: result.results,
          currentPage: result.page,
          totalPages: result.totalPages,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: DiscoverStatus.failure));
    }
  }

  FutureOr<void> _onGenresListRequested(
    GenresListRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(genreStatus: GenreStatus.loading));
    try {
      final genres = await _movieRepository.getGenres();
      emit(
        state.copyWith(
          genresList: genres,
          genreStatus: GenreStatus.success,
        ),
      );
    } on Exception {
      emit(state.copyWith(genreStatus: GenreStatus.failure));
    }
  }
}
