import 'package:dartz/dartz.dart';
import 'package:getflix/features/movies/domain/entities/movies_entity.dart';
import 'package:getflix/features/movies/domain/repositories/movies_repository.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/use_cases/usecase.dart';

class ParamsMoviesUseCase {
  final String language;
  final int page;

  const ParamsMoviesUseCase({
    required this.language,
    required this.page,
  });
}

class GetMoviesUseCaseResult {
  GetMoviesUseCaseResult({required this.result});
  final MoviesEntity result;
}

class GetMoviesUseCase extends UseCase<GetMoviesUseCaseResult, ParamsMoviesUseCase> {

  /// Get Movies Use Case
  GetMoviesUseCase(this.repository);

  final MoviesRepository repository;

  @override
  Future<Either<Failure, GetMoviesUseCaseResult>> call(ParamsMoviesUseCase params,) async {
    
    // Get movies from API
    final result = await repository.getMovies(page: params.page, language: params.language);

    // Return result
    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(
        GetMoviesUseCaseResult(
          result: resp.result,
        ),
      ),
    );

  }
}
