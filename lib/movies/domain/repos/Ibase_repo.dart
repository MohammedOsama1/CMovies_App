import 'package:dartz/dartz.dart';
import 'package:movie_clean/movies/core/errorexe.dart';
import 'package:movie_clean/movies/domain/entity/movie.dart';

abstract class IBaseRepo {
  Future<Either<MyError, List<Movie>>>  getNowPlaying();

  Future<Either<MyError, List<Movie>>>  getPopularMovies();

  Future<Either<MyError, List<Movie>>>  getTopRatedMovies();
}
