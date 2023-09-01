
import 'package:getflix/features/movies/data/models/movie_detail_model.dart';

import '../models/movies_model.dart';

abstract class MoviesDataSource {

  /// Returns the movies from the API
  Future<MoviesModel> getMovies({
    required int page,
    String language = 'es-MX',
  });

  /// Returns the movie detail from the API
  Future<MovieDetailModel> getMovieDetail({
    required int id,
    String language = 'es-MX',
  });

}
