class MovieModel {
  final int id;
  final bool adult;
  final String? movieImage;
  final String language;
  final String title;
  final String overview;
  final String? posterImage;
  final String releaseDate;
  final num voteAverage;

  MovieModel({
    required this.id,
    required this.adult,
    this.movieImage,
    required this.language,
    required this.title,
    required this.overview,
    this.posterImage,
    required this.releaseDate,
    required this.voteAverage,
  });
  factory MovieModel.fromJson(jsonData) {
    return MovieModel(
      adult: jsonData['adult'],
      movieImage: jsonData['backdrop_path'],
      language: jsonData['original_language'],
      title: jsonData['original_title'],
      overview: jsonData['overview'],
      posterImage: jsonData['poster_path'],
      releaseDate: jsonData['release_date'],
      voteAverage: jsonData['vote_average'],
      id: jsonData['id'],
    );
  }
}
