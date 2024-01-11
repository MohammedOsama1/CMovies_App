import 'package:movie_clean/movies/data/datasource/movies_remote_datasource.dart';
import 'package:movie_clean/movies/data/repos/base_repo.dart';
import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';
import 'package:movie_clean/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movie_clean/movies/presentation/controller/bLoCEvent.dart';
import 'package:movie_clean/movies/presentation/controller/bLoCState.dart';
import 'package:bloc/bloc.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState()) {
    on<GetNowPlayingEvent>((event, emit) {
      INetworkMovies INC = NetworkMovies();
      IBaseRepo baseRepo = BaseRepo(INC);
      final result = GetNowPlayingUseCase(baseRepo).execute();
      emit(MovieState(soso: currentState.loadded));
      result.fold((l)=>emit(MovieState(soso: currentState.error)),(r) =>emit(MovieState(soso: currentState.loadded)));
    });
  }
}
