
import 'dart:convert';
import 'package:getflix/features/movies/data/models/credits_model.dart';
import 'package:getflix/features/movies/data/models/movie_detail_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/network/server_api_constants.dart';
import '../models/movies_model.dart';
import 'movies_datasource.dart';

class MoviesDatasourceImpl extends MoviesDataSource {
  
  @override
  Future<MoviesModel> getMovies({
    required int page,
    String? language = 'es-MX',
  }) async {

    final http.Response result = await http.get(
      Uri.parse('${ServerApiConstants.baseUrl}/popular?language=$language-US&page=$page'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ServerApiConstants.tokenApiKey}'
      }
    );

    final parsedResult = MoviesModel.fromJson(
      jsonDecode(result.body),
    );

    return parsedResult;
  }

  @override
  Future<MovieDetailModel> getMovieDetail({required int movieId, String? language = 'es-MX'}) async {
    
    final http.Response result = await http.get(
      Uri.parse('${ServerApiConstants.baseUrl}/$movieId?language=$language-US'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ServerApiConstants.tokenApiKey}'
      }
    );

    final parsedResult = MovieDetailModel.fromJson(
      jsonDecode(result.body),
    );

    return parsedResult;

  }
  
  @override
  Future<CreditsModel> getCredits({required int movieId, String? language = 'es-MX'}) async {
    
    final http.Response result = await http.get(
      Uri.parse('${ServerApiConstants.baseUrl}/$movieId/credits?language=$language-US'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ServerApiConstants.tokenApiKey}'
      }
    );

    final parsedResult = CreditsModel.fromJson(
      jsonDecode(result.body),
    );

    return parsedResult;
  }

}
