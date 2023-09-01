import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movie_detail_use_case.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movies_use_case.dart';
import 'package:getflix/features/movies/presentation/bloc/movies_state.dart';

part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUsecase;
  final GetMovieDetailUseCase getMovieDetailUseCase;

  MoviesBloc({
    required this.getMoviesUsecase,
    required this.getMovieDetailUseCase,
  }) : super(InitMoviesState()){

    // Get Movies Event
    on<GetMoviesEvent>((event, emit) async {
      await _getMoviesEvent(event, emit);
    });

    // Get Movie Detail Event by id
    on<GetMovieDetailEvent>((event, emit) async {
      await _getMovieDetailEvent(event: event, emit: emit);
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

  Future<MoviesState> _getMovieDetailEvent({
    required GetMovieDetailEvent event, 
    required Emitter<MoviesState> emit
  }) async {

    emit(LoadingMoviesState());

    final result = await getMovieDetailUseCase(ParamsMovieDetailUseCase(
      language: 'es-MX',
      id: event.id,
    ));

    return result.fold((l) {

      emit(FailedMoviesState());
      
      return FailedMoviesState();

    }, (r) {

      emit(SuccessMovieDetailState(movieDetailEntity: r.result));
      
      return SuccessMovieDetailState(movieDetailEntity: r.result);

    });

  }
}
