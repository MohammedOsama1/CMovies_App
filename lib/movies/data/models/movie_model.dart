import 'package:movie_clean/movies/domain/entity/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.adult,
      required super.backdropPath,
      required super.id,
      required super.title,
      required super.overview,
      required super.posterPath,
      required super.genreIds,
      required super.popularity,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
      releaseDate: json['release_date'],
      popularity: json['popularity'],
    );
  }
}
