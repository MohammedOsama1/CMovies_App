import 'package:movie_clean/movies/domain/entity/movie.dart';

class MovieState {
  final List<Movie> nowPlaying;

  final currentState soso;

  MovieState({this.soso = currentState.loading,this.nowPlaying = const [] });
}

enum currentState { loading, loadded, error, suc }
