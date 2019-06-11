class Movie {
  final String title;
  final String year;
  final String poster;
  final String imdbRating;
  final String imdbID;
  final String released;
  final String plot;

  Movie({
    this.title,
    this.year,
    this.poster,
    this.imdbRating,
    this.imdbID,
    this.released,
    this.plot
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      imdbID: json['imdbID'],
      year: json['Year'],
      title: json['Title'],
      poster: json['Poster'],
      imdbRating: json['imdbRating'],
      plot: json['Plot']
    );
  }
}