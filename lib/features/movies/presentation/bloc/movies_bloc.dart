import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movies_use_case.dart';
import 'package:getflix/features/movies/presentation/bloc/movies_state.dart';

part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUsecase;

  MoviesBloc({
    required this.getMoviesUsecase,
  }) : super(InitMoviesState()){

    on<GetMoviesEvent>((event, emit) async {
      await _getMoviesEvent(event, emit);
    });

  }

  /// Get Movies Event
  Future<MoviesState> _getMoviesEvent(event, emit) async {

    emit(LoadingMoviesState());

    final result = await getMoviesUsecase(const ParamsMoviesUseCase(
      language: 'es-MX',
      page: 1,
    ));

    return result.fold((l) {

      emit(FailedMoviesState());
      
      return FailedMoviesState();

    }, (r) {

      emit(SuccessMoviesState(moviesEntity: r.result));
      
      return SuccessMoviesState(moviesEntity: r.result);

    });
  }
}
