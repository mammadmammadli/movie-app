import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/models/baseResponse.dart';
import 'package:movie/models/movie.dart';

class MovieService {
  final String url = 'https://api.themoviedb.org/3/trending/all/day';
  final String apiKey = '1e6d937045cd2b1fdd69e0c9067fe730';


  Future<BaseResponse<Movie>> getTrendings () async {
    final resp = await http.get("$url?api_key=$apiKey");
    final data = BaseResponse<Movie>.fromJson(json.decode(resp.body));
    return data;
  }
}