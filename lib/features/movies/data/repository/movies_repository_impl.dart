import 'package:dartz/dartz.dart';
import 'package:getflix/core/network/failure.dart';
import 'package:getflix/features/movies/data/datasources/movies_datasource.dart';
import 'package:getflix/features/movies/data/models/movies_model.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movie_detail_use_case.dart';

import '../../domain/repositories/movies_repository.dart';
import '../../domain/use_cases/get_credits_movie_use_case.dart';
import '../../domain/use_cases/get_movies_use_case.dart';
import '../models/credits_model.dart';

class MoviesRepositoryImpl extends MoviesRepository {

  final MoviesDataSource dataSource;

  MoviesRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, GetMoviesUseCaseResult>> getMovies({
    required int page,
    String? language = 'es-MX',
  }) async {

    // Get movies from API
    final MoviesModel result = await dataSource.getMovies(page: page, language: language);

    // Return result
    return Right(
      GetMoviesUseCaseResult(
        result: result,
      ),
    );

  }

  @override
  Future<Either<Failure, GetMovieDetailUseCaseResult>> getMovieDetail({required int movieId, String? language = 'es-MX'}) async {
    final result = await dataSource.getMovieDetail(movieId: movieId, language: language);

    return Right(
      GetMovieDetailUseCaseResult(
        result: result,
      ),
    );
  }

  @override
  Future<Either<Failure, GetCreditsUseCaseResult>> getCredits({required int movieId, String? language = 'es-MX'}) async {
    final CreditsModel result = await dataSource.getCredits(movieId: movieId, language: language);

    return Right(
      GetCreditsUseCaseResult(
        result: result,
      ),
    );
  }

}