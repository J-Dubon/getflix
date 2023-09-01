part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesEvent extends MoviesEvent {

  /// Get Movies Event
  const GetMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailEvent extends MoviesEvent {

  /// Get Movie Detail Event
  const GetMovieDetailEvent({
    required this.movieId,
  });

  final int movieId;

  @override
  List<Object> get props => [movieId];
}

class GetCreditsEvent extends MoviesEvent {

  /// Get Credits Event
  const GetCreditsEvent({
    required this.movieId,
  });

  final int movieId;

  @override
  List<Object> get props => [movieId];
}

class GetMovieInfoDetailEvent extends MoviesEvent {

  /// Get Movie Info Detail Event
  const GetMovieInfoDetailEvent({
    required this.movieId,
  });

  final int movieId;

  @override
  List<Object> get props => [movieId];
}
