import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';

class GetNowPlayingUseCase {
  IBaseRepo baseRepo;

  GetNowPlayingUseCase(this.baseRepo);

  execute() {
    return baseRepo.getNowPlaying();
  }
}
