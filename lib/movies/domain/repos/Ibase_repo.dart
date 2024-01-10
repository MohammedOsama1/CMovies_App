import 'package:dartz/dartz.dart';
import 'package:movie_clean/movies/core/errorexe.dart';
import 'package:movie_clean/movies/domain/entity/movie.dart';

abstract class IBaseRepo {
  Either<MyError,Future<List<Movie>>> getNowPlaying();

  Either<MyError,Future<List<Movie>>> getPopularMovies();

  Either<MyError,Future<List<Movie>>> getTopRatedMovies();
}
