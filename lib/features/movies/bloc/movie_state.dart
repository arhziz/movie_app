// ignore_for_file: public_member_api_docs

part of 'movie_bloc.dart';

enum MoviesStatus { initial, loading, success, failure }

extension MoviesStatusX on MoviesStatus {
  bool get isInitial => this == MoviesStatus.initial;
  bool get isLoading => this == MoviesStatus.loading;
  bool get isSuccess => this == MoviesStatus.success;
  bool get isFailure => this == MoviesStatus.failure;
}

final class MovieState extends Equatable {
  const MovieState({
    this.status = MoviesStatus.initial,
    this.movie = MovieModel.empty,
  });

  final MoviesStatus status;

  final MovieModel movie;

  MovieState copyWith({
    MoviesStatus? status,
    MovieModel? movie,
  }) =>
      MovieState(
        status: status ?? this.status,
        movie: movie ?? this.movie,
      );

  @override
  List<Object> get props => [
        status,
        movie,
      ];
}
