import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/entities/actor_entity.dart';
import 'package:getflix/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:getflix/features/movies/domain/entities/movies_entity.dart';

import '../../domain/entities/credits_entity.dart';

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

class FailedMoviesState extends MoviesState {
  @override
  List<Object?> get props => [];
}

// ---------------------------------------------------------------
// Get Movies State
// ---------------------------------------------------------------

class SuccessMoviesState extends MoviesState {
  const SuccessMoviesState({
    required this.moviesEntity,
  });

  final MoviesEntity moviesEntity;

  @override
  List<Object?> get props => [moviesEntity];
}

class GetMoviesState extends MoviesState {

  const GetMoviesState({
    required this.moviesEntity,
  });

  final MoviesEntity moviesEntity;

  @override
  List<Object?> get props => [];

  GetMoviesState copyWith({
    MoviesEntity? moviesEntity,
  }) {
    return GetMoviesState(
      moviesEntity: moviesEntity ?? this.moviesEntity,
    );
  }

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

// ---------------------------------------------------------------
// Get Movie Detail State
// ---------------------------------------------------------------

class SuccessMovieDetailState extends MoviesState {
  const SuccessMovieDetailState({
    required this.movieDetailEntity,
  });

  final MovieDetailEntity movieDetailEntity;

  @override
  List<Object?> get props => [movieDetailEntity];
}

class GetMovieDetailState extends MoviesState {

  const GetMovieDetailState({
    required this.movieDetailEntity,
  });

  final MovieDetailEntity movieDetailEntity;

  @override
  List<Object?> get props => [];

  @override
  String toString() => '''
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    GetMovieDetailState Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      GetMovieDetailState {
        movieDetailEntity: $movieDetailEntity,
      }
    ----- ----- ----- ----- ----- ----- ----- ----- -----
  ''';

}

// ---------------------------------------------------------------
// Get Credits State
// ---------------------------------------------------------------

class SuccessCreditsState extends MoviesState {
  const SuccessCreditsState({
    required this.creditsEntity,
  });

  final CreditsEntity creditsEntity;

  @override
  List<Object?> get props => [creditsEntity];
}

class GetCreditsState extends MoviesState {

  const GetCreditsState({
    required this.creditsEntity,
  });

  final CreditsEntity creditsEntity;

  @override
  List<Object?> get props => [];

  @override
  String toString() => '''
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    GetCreditsState Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      GetCreditsState {
        creditsEntity: $creditsEntity,
      }
    ----- ----- ----- ----- ----- ----- ----- ----- -----
  ''';

}

// ---------------------------------------------------------------
// Get Movie Info Detail State
// ---------------------------------------------------------------

class SuccessMovieInfoDetailState extends MoviesState {
  const SuccessMovieInfoDetailState({
    required this.movieDetail,
    required this.cast,
  });

  final MovieDetailEntity movieDetail;
  final List<ActorEntity> cast;

  @override
  List<Object?> get props => [movieDetail, cast];
}

class GetMovieInfoDetailState extends MoviesState {

  const GetMovieInfoDetailState({
    required this.movieDetail,
    required this.cast,
  });
  
  final MovieDetailEntity movieDetail;
  final List<ActorEntity> cast;

  @override
  List<Object?> get props => [];

  @override
  String toString() => '''
    ----- ----- ----- ----- ----- ----- ----- ----- -----
    GetMovieInfoDetailState Object
    ----- ----- ----- ----- ----- ----- ----- ----- -----
      GetMovieInfoDetailState {
        movieDetail: $movieDetail,
        cast: $cast,
      }
    ----- ----- ----- ----- ----- ----- ----- ----- -----
  ''';

}