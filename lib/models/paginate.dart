import 'movie.dart';

class Pagination{
  final int page;
  final List<Movie> results;
  final int total_pages;
  final int total_results;

  Pagination({
    this.page, 
    this.total_pages, 
    this.total_results,
    this.results
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    var data = json['results'] as List;
    List<Movie> list = data.map<Movie>((movie) => Movie.fromJson(movie)).toList();
    // var list = json['results'];
    // List<T> res = new List<T>.from(list);
    // print(res);
    return Pagination(
      page: json['page'],
      results: list,
      total_pages: json['total_pages'],
      total_results: json['total_results']
    );
  }

  // T convertResponse<T>(Map<String, dynamic> data) {
  //   return data['results'] as T;
  // }
}