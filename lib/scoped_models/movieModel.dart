import 'package:movie/models/movie.dart';
import 'package:scoped_model/scoped_model.dart';

mixin MovieModel on Model{

  List<Movie> _movies = [];

  Movie searchedMovie;
  
  List<Movie> get movies {
    return List.from(_movies);
  }

  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }

  void deleteMovie(String imdbID) {
    _movies.removeWhere((movie) => movie.imdbID == imdbID);
    notifyListeners();
  }

  void undoMovie (int index, Movie movie) {
    _movies.insert(index, movie);
    notifyListeners();
  }

  bool isMovieLiked (Movie __movie) {
    if(this._movies.indexWhere((movie) => movie.imdbID == __movie.imdbID) != -1) {
      return true;
    }
    return false;
  }

  void addSearchedMovie (Movie _movie) {
    this.searchedMovie = _movie;
    notifyListeners();
  }
}