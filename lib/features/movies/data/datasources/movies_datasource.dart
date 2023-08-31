
import '../models/movies_model.dart';

abstract class MoviesDataSource {

  /// Returns the movies from the API
  Future<MoviesModel> getMovies({
    required int page,
    String language = 'es-MX',
  });

}
