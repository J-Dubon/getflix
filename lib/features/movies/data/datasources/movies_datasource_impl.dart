
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/network/server_api_constants.dart';
import '../models/movies_model.dart';
import 'movies_datasource.dart';

class MoviesDatasourceImpl extends MoviesDataSource {
  
  @override
  Future<MoviesModel> getMovies({
    required int page,
    String language = 'es-MX',
  }) async {

    final http.Response result = await http.get(
      Uri.parse('${ServerApiConstants.baseUrl}/popular?language=$language-US&page=$page'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${ServerApiConstants.tokenApiKey}'
      }
    );

    return MoviesModel.fromJson(
      jsonDecode(jsonEncode(result)),
    );
  }

}
