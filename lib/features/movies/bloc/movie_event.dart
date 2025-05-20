part of 'movie_bloc.dart';

///
final class MovieEvent extends Equatable {
  ///
  const MovieEvent();

  @override
  List<Object> get props => [];
}

///
final class FetchMovieDetailEvent extends MovieEvent {
  ///
  const FetchMovieDetailEvent({required this.id});

  ///Movie primary key
  ///This is used to search
  final int id;
}

///
final class SetMovieModelEvent extends MovieEvent {
  ///
  const SetMovieModelEvent(this.movie);

  ///
  final MovieModel movie;
}
