import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_api/movie_app_api.dart';
import 'package:movie_app_repository/movie_app_repository.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

/// OnBoardingBloc class
/// This class is responsible for managing the state of the Onboarding process.
class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  /// Creates an instance of OnBoardingBloc.
  OnBoardingBloc(this._movieRepository, this._authenticationRepository)
      : super(const OnBoardingState()) {
    on<OnBoardingGenresListRequested>(_onGenresListRequested);
    on<OnBoardingGenresSelected>(_onGenresSelected);
    on<OnBoardingCompleted>(_onOnBoardingCompleted);
  }

  final MovieRepository _movieRepository;
  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> _onGenresListRequested(
    OnBoardingGenresListRequested event,
    Emitter<OnBoardingState> emit,
  ) async {
    emit(state.copyWith(status: OnBoardingStatus.loading));
    try {
      final genres = await _movieRepository.getGenres();
      emit(
        state.copyWith(
          genresList: genres,
          status: OnBoardingStatus.success,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: OnBoardingStatus.failure));
    }
  }

  FutureOr<void> _onGenresSelected(
    OnBoardingGenresSelected event,
    Emitter<OnBoardingState> emit,
  ) {
    final selectedGenres = List<Genre>.from(state.selectedGenres);
    if (selectedGenres.contains(event.selectedGenre)) {
      selectedGenres.remove(event.selectedGenre);
    } else {
      selectedGenres.add(event.selectedGenre);
    }
    emit(state.copyWith(selectedGenres: selectedGenres));
  }

  FutureOr<void> _onOnBoardingCompleted(
    OnBoardingCompleted event,
    Emitter<OnBoardingState> emit,
  ) {
    emit(
      state.copyWith(
        selectedGenres: state.selectedGenres,
        status: OnBoardingStatus.loading,
      ),
    );
    // Save the selected genres to the repository or perform any other action
    // needed to complete the onboarding process.
    _authenticationRepository.saveOnBoardingStatus(state.selectedGenres);
    emit(
      state.copyWith(
        status: OnBoardingStatus.completed,
      ),
    );
  }
}
