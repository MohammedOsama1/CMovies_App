import 'dart:convert';

import 'package:movie_clean/movies/core/end_points.dart';
import 'package:movie_clean/movies/core/errorexe.dart';
import 'package:movie_clean/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http ;

abstract class INetworkMovies {
  Future<List<MovieModel>> getNowPlaying();

  Future<List<MovieModel>>  getPopularMovies();

  Future<List<MovieModel>>  getTopRatedMovies();
}
class NetworkMovies implements INetworkMovies   {
  @override
  Future<List<MovieModel>> getNowPlaying()  async {
    http.Response response = await http.get(Uri.parse(ApiEndPoints.baseUrl+ApiEndPoints.apiKey)) ;
    var data = json.decode(response.body);
    if (response.statusCode==200)  {
      return List<MovieModel>.from(data["results"].map((e)=>MovieModel.fromJson(e)));
    } else {
      throw MyError("message");
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    throw UnimplementedError();

  }

  }
//*--*//*--*/