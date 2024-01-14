import 'package:get_it/get_it.dart';
import 'package:movie_clean/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movie_clean/movies/data/repos/base_repo.dart';
import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';
import 'package:movie_clean/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/bLoC.dart';

GetIt sl = GetIt.instance;

class Ser {
  void init() {
    sl.registerLazySingleton(() => MoviesbLoC(sl()));
    sl.registerLazySingleton<IBaseRepo>(() => BaseRepo(sl()));
    sl.registerLazySingleton<INetworkMovies>(() => NetworkMovies());
  }
}
