import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../use_cases/get_movie_detail_use_case.dart';
import '../use_cases/get_movies_use_case.dart';

abstract class MoviesRepository {

  /// Get Movies from API
  Future<Either<Failure, GetMoviesUseCaseResult>> getMovies({
    required int page,
    String language = 'es-MX',
  });

  /// Get Movie Detail from API
  Future<Either<Failure, GetMovieDetailUseCaseResult>> getMovieDetail({
    required int id,
    String language = 'es-MX',
  });
}