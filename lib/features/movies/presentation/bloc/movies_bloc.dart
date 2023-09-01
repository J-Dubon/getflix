import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/use_cases/get_credits_movie_use_case.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movie_detail_use_case.dart';
import 'package:getflix/features/movies/domain/use_cases/get_movies_use_case.dart';
import 'package:getflix/features/movies/presentation/bloc/movies_state.dart';

part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase getMoviesUsecase;
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetCreditsUseCase getCreditsUseCase;

  MoviesBloc({
    required this.getMoviesUsecase,
    required this.getMovieDetailUseCase,
    required this.getCreditsUseCase,
  }) : super(InitMoviesState()){

    // Get Movies Event
    on<GetMoviesEvent>((event, emit) async {
      await _getMoviesEvent(event, emit);
    });

    // Get Movie Detail Event by id
    on<GetMovieDetailEvent>((event, emit) async {
      await _getMovieDetailEvent(event: event, emit: emit);
    });

    // Get Credits Event by id
    on<GetCreditsEvent>((event, emit) async {
      await _getCreditsEvent(event: event, emit: emit);
    });

    // Get Movie Info Detail Event by id
    on<GetMovieInfoDetailEvent>((event, emit) async {
      await _getMovieInfoDetailEvent(event: event, emit: emit);
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
      movieId: event.movieId,
    ));

    return result.fold((l) {

      emit(FailedMoviesState());
      
      return FailedMoviesState();

    }, (r) {

      emit(SuccessMovieDetailState(movieDetailEntity: r.result));
      
      return SuccessMovieDetailState(movieDetailEntity: r.result);

    });

  }
  
  Future<MoviesState> _getCreditsEvent({
    required GetCreditsEvent event,
    required Emitter<MoviesState> emit,
  }) async {
      
    emit(LoadingMoviesState());

    final result = await getCreditsUseCase(ParamsCreditsUseCase(
      language: 'es-MX',
      movieId: event.movieId,
    ));

    return result.fold((l) {

      emit(FailedMoviesState());
      
      return FailedMoviesState();

    }, (r) {

      emit(SuccessCreditsState(creditsEntity: r.result));
      
      return GetCreditsState(creditsEntity: r.result);

    });
  }
  
  Future<void> _getMovieInfoDetailEvent({
    required GetMovieInfoDetailEvent event, 
    required Emitter<MoviesState> emit
  }) async {
    emit(LoadingMoviesState());

    final movieDetailResult = await getMovieDetailUseCase(ParamsMovieDetailUseCase(
      language: 'es-MX',
      movieId: event.movieId,
    ));

    final creditsResult = await getCreditsUseCase(ParamsCreditsUseCase(
      language: 'es-MX',
      movieId: event.movieId,
    ));

    movieDetailResult.fold((l) => null, (rMovieDetail) => 
      creditsResult.fold((l) => null, (rCredits) => 
        emit(SuccessMovieInfoDetailState(movieDetail: rMovieDetail.result, cast: rCredits.result.cast)
      ))
    );
  }
}
