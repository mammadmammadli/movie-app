import 'package:scoped_model/scoped_model.dart';

mixin MovieModel on Model{

  List<String> _movies = [];
  
  List<String> get movies {
    return List.from(_movies);
  }

  void addMovie(String imdbID) {
    _movies.add(imdbID);
    notifyListeners();
  }

  void deleteMovie(String imdbID) {
    _movies.removeWhere((test) => test == imdbID);
    notifyListeners();
  }

  bool isMovieLiked (String imdbID) {
    print(this.movies);
    if (this._movies.contains(imdbID)) return true;
    return false;
  }
}