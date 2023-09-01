import 'package:dartz/dartz.dart';
import 'package:getflix/features/movies/domain/repositories/movies_repository.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/use_cases/usecase.dart';
import '../entities/movie_detail_entity.dart';

class ParamsMovieDetailUseCase {
  final String? language;
  final int movieId;

  const ParamsMovieDetailUseCase({
    this.language,
    required this.movieId,
  });
}

class GetMovieDetailUseCaseResult {
  GetMovieDetailUseCaseResult({required this.result});

  final MovieDetailEntity result;
}

class GetMovieDetailUseCase extends UseCase<GetMovieDetailUseCaseResult, ParamsMovieDetailUseCase> {

  /// Get Movies Use Case
  GetMovieDetailUseCase(this.repository);

  final MoviesRepository repository;

  @override
  Future<Either<Failure, GetMovieDetailUseCaseResult>> call(ParamsMovieDetailUseCase params,) async {
    
    // Get movies from API
    final result = await repository.getMovieDetail(movieId: params.movieId, language: params.language);

    // Return result
    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(
        GetMovieDetailUseCaseResult(
          result: resp.result,
        ),
      ),
    );

  }
}
