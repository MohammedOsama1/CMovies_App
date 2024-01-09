abstract class IBaseRepo {
  Future<List<String>> getNowPlaying();

  Future<List<String>> getPopularMovies();

  Future<List<String>> getTopRatedMovies();
}
