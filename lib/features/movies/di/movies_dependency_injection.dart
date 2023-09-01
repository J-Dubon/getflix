
import 'package:getflix/features/movies/data/datasources/movies_datasource.dart';
import 'package:getflix/features/movies/data/datasources/movies_datasource_impl.dart';
import 'package:getflix/features/movies/data/repository/movies_repository_impl.dart';
import 'package:getflix/features/movies/domain/repositories/movies_repository.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movie_detail_use_case.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movies_use_case.dart';
import 'package:getflix/features/movies/presentation/bloc/movies_bloc.dart';

import '../../../core/dependency_injection/injection_container.dart';
import '../domain/use_cases/get_credits_movie_use_case.dart';

Future<void> initMoviesDependencies() async {

  _unregisterServices();

  getIt.registerFactory(
    () => MoviesBloc(
      getMoviesUsecase: getIt(),
      getMovieDetailUseCase: getIt(),
      getCreditsUseCase: getIt(),
    ),
  );

  getIt.registerLazySingleton<MoviesDataSource>(
    () => MoviesDatasourceImpl(),
  );

  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      dataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton(() => GetMoviesUseCase(getIt()));

  getIt.registerLazySingleton(() => GetMovieDetailUseCase(getIt()));

  getIt.registerLazySingleton(() => GetCreditsUseCase(getIt()));

}

void _unregisterServices() {
  removeRegistrationIfExists<MoviesDataSource>();
  removeRegistrationIfExists<MoviesRepository>();
  removeRegistrationIfExists<GetMoviesUseCase>();
  removeRegistrationIfExists<GetMovieDetailUseCase>();
  removeRegistrationIfExists<GetCreditsUseCase>();
}