import 'package:getflix/features/movies/data/models/movie_model.dart';
import 'package:getflix/features/movies/domain/entities/movies_entity.dart';

class MoviesModel extends MoviesEntity {

  const MoviesModel({
    required super.page,
    required super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
      page: json["page"],
      results: List<MovieModel>.from(json["results"].map((x) => MovieModel.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
      "page": page,
      "results": List<dynamic>.from(results.map((x) => x)),
      "total_pages": totalPages,
      "total_results": totalResults,
  };
}
