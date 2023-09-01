
import 'package:getflix/features/movies/data/models/credits_model.dart';
import 'package:getflix/features/movies/data/models/movie_detail_model.dart';

import '../models/movies_model.dart';

abstract class MoviesDataSource {

  /// Returns the movies from the API
  Future<MoviesModel> getMovies({
    required int page,
    String? language = 'es-MX',
  });

  /// Returns the movie detail from the API
  Future<MovieDetailModel> getMovieDetail({
    required int movieId,
    String? language = 'es-MX',
  });

  /// Returns the movie credits from the API
  Future<CreditsModel> getCredits({
    required int movieId,
    String? language = 'es-MX',
  });

}
