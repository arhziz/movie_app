import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_api/movie_app_api.dart'
    show DiscoverMoviesRequest, Movie, MovieResponse;
import 'package:movie_app_repository/movie_app_repository.dart';

part 'movies_cubit.g.dart';
part 'movies_state.dart';

///@template movies_cubit_item
///@endtemplate
class MoviesCubit extends HydratedCubit<MoviesState> {
  ///@macro movies_cubit_item
  MoviesCubit(this._movieRepository) : super(const MoviesState());

  final MovieRepository _movieRepository;

  ///Fetches the discovered movies from the repository
  Future<void> fetchDiscoveredMovies() async {
    emit(state.copyWith(status: MoviesStatus.loading));
    try {
      final result = await _movieRepository.discoverMovies(
        DiscoverMoviesRequest(
          page: state.currentPage < state.totalPages
              ? state.currentPage + 1
              : state.totalPages == 0
                  ? state.currentPage + 1
                  : state.currentPage,
        ),
      );
      emit(
        state.copyWith(
          status: MoviesStatus.success,
          discoveredMovies: result.results,
          currentPage: result.page,
          totalPages: result.totalPages,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: MoviesStatus.failure));
    }
  }

  @override
  MoviesState? fromJson(Map<String, dynamic> json) =>
      MoviesState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(MoviesState state) => state.toJson();
}
