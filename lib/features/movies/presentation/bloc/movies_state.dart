import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/entities/movies_entity.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class InitMoviesState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class LoadingMoviesState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class SuccessMoviesState extends MoviesState {
  const SuccessMoviesState({
    required this.moviesEntity,
  });

  final MoviesEntity moviesEntity;

  @override
  List<Object?> get props => [moviesEntity];
}

class FailedMoviesState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class GetMoviesState extends MoviesState {

  const GetMoviesState({
    required this.moviesEntity,
  });

  final MoviesEntity moviesEntity;

  @override
  List<Object?> get props => [];

  @override
  String toString() => '''
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    GetMoviesState Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      GetMoviesState {
        moviesEntity: $moviesEntity,
      }
    ----- ----- ----- ----- ----- ----- ----- ----- -----
  ''';
}