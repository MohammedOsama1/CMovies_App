import 'package:dartz/dartz.dart';
import 'package:movie_clean/movies/core/errorexe.dart';
import 'package:movie_clean/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movie_clean/movies/domain/entity/movie.dart';
import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';

class BaseRepo extends IBaseRepo {
  INetworkMovies _iNetworkMovies;

  BaseRepo(this._iNetworkMovies);

  @override
  Future<Either<MyError, List<Movie>>> getNowPlaying() async  {
    final result = await _iNetworkMovies.getNowPlaying();
    try {
      return Right(result);
    } on MyError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<MyError, List<Movie>>> getPopularMovies()async {
    final result = await _iNetworkMovies.getPopularMovies();
    try {
      return Right(result);
    } on MyError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<MyError, List<Movie>>> getTopRatedMovies() async {
    final result = await _iNetworkMovies.getTopRatedMovies();
    try {
      return Right(result);
    } on MyError catch (e) {
      return Left(e);
    }
  }
}
