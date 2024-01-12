import 'dart:convert';

import 'package:movie_clean/movies/core/end_points.dart';
import 'package:movie_clean/movies/core/errorexe.dart';
import 'package:movie_clean/movies/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movie_clean/movies/domain/entity/movie.dart';

abstract class INetworkMovies {
  Future<List<Movie>> getNowPlaying();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();
}

class NetworkMovies implements INetworkMovies {
  @override
  Future<List<Movie>> getNowPlaying() async {
    http.Response response = await http.get(
        Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.apiKey));
    var data = json.decode(response.body);
    if (response.statusCode == 200) {

      return List<MovieModel>.from(data["results"].map((e) => MovieModel.fromJson(e)));
    } else {
      throw MyError("message");
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/tv/on_the_air?api_key=9f9adc14862323a1d605dec2b8fb6f26");
    http.Response response = await http.get(url);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
     return List<MovieModel>.from(data["results"].map((e) => MovieModel.fromJson(e)));
    } else {
      throw MyError("message");
    }

  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    Uri url = Uri.parse(
        "https://api.themoviedb.org/3/tv/on_the_air?api_key=9f9adc14862323a1d605dec2b8fb6f26");
    http.Response response = await http.get(url);
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(data["results"].map((e) => MovieModel.fromJson(e)));
    } else {
      throw MyError("message");
    }
  }
}
