class Movie {
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? overview;
  final List<int>? genreIds;
  final String? releaseDate;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.overview,
    required this.genreIds,
    required this.releaseDate,
  });
}
