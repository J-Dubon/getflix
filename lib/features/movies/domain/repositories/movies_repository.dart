import 'package:dartz/dartz.dart';

import '../../../../core/network/failure.dart';
import '../use_cases/get_movies_use_case.dart';

abstract class MoviesRepository {

  /// Get Movies from API
  Future<Either<Failure, GetMoviesUseCaseResult>> getMovies({
    required int page,
    String language = 'es-MX',
  });
}