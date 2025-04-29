// ignore_for_file: public_member_api_docs

part of 'movies_cubit.dart';

enum MoviesStatus { initial, loading, success, failure }

extension MoviesStatusX on MoviesStatus {
  bool get isInitial => this == MoviesStatus.initial;
  bool get isLoading => this == MoviesStatus.loading;
  bool get isSuccess => this == MoviesStatus.success;
  bool get isFailure => this == MoviesStatus.failure;
}

@JsonSerializable()
final class MoviesState extends Equatable {
  const MoviesState({
    this.status = MoviesStatus.initial,
    this.discoveredMovies = const [],
    this.currentPage = 0,
    this.totalPages = 0,
  });

  factory MoviesState.fromJson(Map<String, dynamic> json) =>
      _$MoviesStateFromJson(json);

  final MoviesStatus status;
  final List<Movie> discoveredMovies;
  final int currentPage;
  final int totalPages;

  Map<String, dynamic> toJson() => _$MoviesStateToJson(this);

  MoviesState copyWith({
    MoviesStatus? status,
    List<Movie>? discoveredMovies,
    int? currentPage,
    int? totalPages,
  }) =>
      MoviesState(
        status: status ?? this.status,
        discoveredMovies: discoveredMovies ?? this.discoveredMovies,
        currentPage: currentPage ?? this.currentPage,
        totalPages: totalPages ?? this.totalPages,
      );

  @override
  List<Object> get props => [
        status,
        discoveredMovies,
        currentPage,
        totalPages,
      ];
}
