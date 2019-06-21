class Movie {
  final bool adult;
  final int id;
  final String backdrop_path;
  final List<dynamic> genre_ids;
  final String original_language;
  final String original_title;
  final String release_date;
  final bool video;

  final String overview;
  final String poster;
  final double vote_average;
  final int vote_count;
  final String title;
  final double popularity;

  Movie({
    this.adult,
    this.id,
    this.overview,
    this.poster,
    this.vote_average,
    this.backdrop_path,
    this.genre_ids,
    this.title,
    this.original_language,
    this.original_title,
    this.popularity,
    this.release_date,
    this.video,
    this.vote_count
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      vote_average: json['vote_average'],
      adult: json['adult'],
      poster: json['poster_path'],
      overview: json['overview'],
      title: json['title'],
      backdrop_path: json['backdrop_path'],
      genre_ids: json['genre_ids'],
      original_language: json['original_language'],
      video: json['video'],
      original_title: json['original_title'],
      popularity: json['popularity'],
      release_date: json['release_date'],
      vote_count: json['vote_count']
    );
  }
}