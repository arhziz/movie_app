import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movies/models/models.dart';
import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

///
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  ///
  MovieBloc(this._movieRepository) : super(const MovieState()) {
    on<FetchMovieDetailEvent>(_fetchMovieDetailEvent);
    on<SetMovieModelEvent>(_setMovieModelEvent);
  }

  final MovieRepository _movieRepository;

  FutureOr<void> _fetchMovieDetailEvent(
    FetchMovieDetailEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(state.copyWith(status: MoviesStatus.loading));
    try {
      final result = await _movieRepository.getMovieDetail(event.id);

      final detailMovie = MovieModel.fromMovieDetail(result);
      emit(
        state.copyWith(
          status: MoviesStatus.success,
          movie: detailMovie,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: MoviesStatus.failure));
    }
  }

  FutureOr<void> _setMovieModelEvent(
    SetMovieModelEvent event,
    Emitter<MovieState> emit,
  ) {
    /// final movieModel = MovieModel.fromMovie(event.movie);
    emit(state.copyWith(status: MoviesStatus.loading));
    emit(state.copyWith(movie: event.movie, status: MoviesStatus.success));
  }
}
