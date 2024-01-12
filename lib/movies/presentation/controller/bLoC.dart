import 'package:movie_clean/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movie_clean/movies/data/repos/base_repo.dart';
import 'package:movie_clean/movies/domain/entity/movie.dart';
import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';
import 'package:movie_clean/movies/domain/usecase/get_popular_popular_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_events.dart';
import 'package:movie_clean/movies/presentation/controller/movies_states.dart';
import 'package:bloc/bloc.dart';

class MoviesbLoC extends Bloc<MoviesEvent, MoviesStates> {
  MoviesbLoC()
      : super(const MoviesStates(
            listOfMovies: [], currentState: AppStates.loading)) {
    on<GetNowPlayingEvent>((event, emit) async {
      INetworkMovies INC = NetworkMovies();
      IBaseRepo baseRepo = BaseRepo(INC);
      final result = await GetNowPlayingUseCase(baseRepo).execute();
      print(result);
      result.fold(
        (l) => emit(const MoviesStates(
          currentState: AppStates.error,
        )),
        (r)  {

          emit(MoviesStates(currentState: AppStates.loaded, listOfMovies:r));
        }

      );
    });
  }
}
