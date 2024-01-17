import 'package:movie_clean/movies/domain/repos/Ibase_repo.dart';

class GetTopRatedUseCase {
  IBaseRepo baseRepo;

  GetTopRatedUseCase(this.baseRepo);


  call(){
    return baseRepo.getTopRatedMovies();
  }
}
