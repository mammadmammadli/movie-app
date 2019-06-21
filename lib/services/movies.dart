import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie/models/movie.dart';
import 'package:movie/models/paginate.dart';

class MovieService {
  final String url = 'https://api.themoviedb.org/3/trending/all/day';
  final String apiKey = '1e6d937045cd2b1fdd69e0c9067fe730';


  Future<Pagination> getTrendings () async {
    final resp = await http.get("$url?api_key=$apiKey");

    final data = Pagination.fromJson(json.decode(resp.body));
    return data;
  }
}