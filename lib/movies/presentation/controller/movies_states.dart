import 'package:flutter/material.dart';
import 'package:movie_clean/movies/domain/entity/movie.dart';

@immutable
class MoviesStates {
  final List<Movie> listOfMovies;

  final AppStates currentState;

  const MoviesStates(
      {this.currentState = AppStates.loading,  this.listOfMovies =  const [] });
}

enum AppStates { loading, loaded, suc, error }
