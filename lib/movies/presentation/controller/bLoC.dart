import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';
import 'package:movie_clean/movies/domain/usecase/get_popular_popular_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_events.dart';
import 'package:movie_clean/movies/presentation/controller/movies_states.dart';
import 'package:bloc/bloc.dart';

class MoviesbLoC extends Bloc<MoviesEvent, MoviesStates> {
  IBaseRepo baseRepo;

  MoviesbLoC(this.baseRepo)
      : super(const MoviesStates(
            nowPlayingList: [], nowPlayingState: AppStates.loading)) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await GetNowPlayingUseCase(baseRepo).execute();
      print(result);
      result.fold(
          (l) => emit(const MoviesStates(
                nowPlayingState: AppStates.error,
              )), (r) {
        emit(MoviesStates(
            nowPlayingState: AppStates.suc, nowPlayingList: r));
      });
    });
  }
}
