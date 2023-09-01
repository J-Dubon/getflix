import 'package:dartz/dartz.dart';
import 'package:getflix/features/movies/domain/repositories/movies_repository.dart';

import '../../../../core/network/failure.dart';
import '../../../../core/use_cases/usecase.dart';
import '../entities/credits_entity.dart';

class ParamsCreditsUseCase {
  final String? language;
  final int movieId;

  const ParamsCreditsUseCase({
    this.language,
    required this.movieId,
  });
}

class GetCreditsUseCaseResult {
  GetCreditsUseCaseResult({required this.result});
  
  final CreditsEntity result;
}

class GetCreditsUseCase extends UseCase<GetCreditsUseCaseResult, ParamsCreditsUseCase> {

  /// Get Movies Use Case
  GetCreditsUseCase(this.repository);

  final MoviesRepository repository;

  @override
  Future<Either<Failure, GetCreditsUseCaseResult>> call(ParamsCreditsUseCase params,) async {
    
    // Get movies from API
    final result = await repository.getCredits(movieId: params.movieId, language: params.language);

    // Return result
    return result.fold(
      (failure) => Left(failure),
      (resp) => Right(
        GetCreditsUseCaseResult(
          result: resp.result,
        ),
      ),
    );

  }
}
