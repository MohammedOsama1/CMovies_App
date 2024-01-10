class Movie {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? overview;
  final String? posterPath;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
  });
}
