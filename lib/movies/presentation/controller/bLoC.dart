import 'dart:async';
import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';
import 'package:movie_clean/movies/domain/usecase/get_popular_popular_usecase.dart';
import 'package:movie_clean/movies/domain/usecase/get_top_rated_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/movies_events.dart';
import 'package:movie_clean/movies/presentation/controller/movies_states.dart';
import 'package:bloc/bloc.dart';

class MoviesbLoC extends Bloc<MoviesEvent, MoviesStates> {
  IBaseRepo baseRepo;

  MoviesbLoC(this.baseRepo) : super(const MoviesStates(
            nowPlayingList: [], nowPlayingState: AppStates.loading)) {
    on<GetNowPlayingEvent>(_playingEvent);
    on<GetTopRatedEvent>(_topRatedEvent);

  }

  FutureOr<void> _topRatedEvent(event,  emit) async {
    final result = await GetTopRatedUseCase(baseRepo).call();
    result.fold(
            (l) => emit(state.copyWith(
              topRatedState: AppStates.error,
        )), (r) {
      emit(state.copyWith(
          topRatedState: AppStates.suc, topRatedList: r));
    });
  }

  FutureOr<void> _playingEvent(event, emit) async  {
    final result = await GetNowPlayingUseCase(baseRepo).execute();
    print(result);
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: AppStates.error,
            )), (r) {
      emit(state.copyWith(
          nowPlayingState: AppStates.suc, nowPlayingList: r));
    });
  }
}
