part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesEvent extends MoviesEvent {

  /// Get Movies Url Event
  const GetMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailEvent extends MoviesEvent {

  /// Get Movie Detail Url Event
  const GetMovieDetailEvent({
    required this.id,
  });

  final int id;

  @override
  List<Object> get props => [id];
}
