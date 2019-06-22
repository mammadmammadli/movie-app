import 'package:movie/models/baseResponse.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/services/movies.dart';
import 'package:scoped_model/scoped_model.dart';

mixin MovieModel on Model{
  MovieService _movieService = MovieService();
  bool _isMovieLoading = false;
  List<Movie> _movies = [];

  List<Movie> _searchedMovies = [];

  String _query = '';

  bool get isMovieLoading {
    return _isMovieLoading;
  }

  List<Movie> get movies {
    return List.from(_movies);
  }

  List<Movie> get searchedMovies {
    return List.from(_searchedMovies);
  }

  String get searchQuery {
    return _query;
  } 

  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }

  void deleteMovie(String imdbID) {
    _movies.removeWhere((movie) => movie.id.toString() == imdbID);
    notifyListeners();
  }

  void undoMovie (int index, Movie movie) {
    _movies.insert(index, movie);
    notifyListeners();
  }

  bool isMovieLiked (Movie __movie) {
    if(this._movies.indexWhere((movie) => movie.id == __movie.id) != -1) {
      return true;
    }
    return false;
  }

  Future<List<Movie>> searchMovie (String query) async {
    _isMovieLoading = true;
    _query = query;
    notifyListeners();
    final BaseResponse<Movie> resp = await _movieService.search(query);
    _searchedMovies = resp.results;
    _isMovieLoading = false;
    notifyListeners();
    return resp.results;
  }

  void clear () {
    _query = '';
    _searchedMovies.clear();
    notifyListeners();
  }

}