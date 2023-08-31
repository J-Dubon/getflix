import 'package:equatable/equatable.dart';
import 'package:getflix/features/movies/domain/entities/movie_entity.dart';

class MoviesEntity extends Equatable  {

  final int page;
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  const MoviesEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MoviesEntity copyWith({
    int? page,
    List<MovieEntity>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return MoviesEntity(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  List<Object?> get props => [
    page,
    results,
    totalPages,
    totalResults,
  ];

  @override
  String toString () => '''
  ----- ----- ----- ----- ----- ----- ----- ----- -----
  Movies Object
  ----- ----- ----- ----- ----- ----- ----- ----- -----
    MoviesEntity {
      page: $page,
      results: $results,
      totalPages: $totalPages,
      totalResults: $totalResults,
    }
  ----- ----- ----- ----- ----- ----- ----- ----- -----
  ''';

}