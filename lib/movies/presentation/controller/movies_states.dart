import 'package:flutter/material.dart';
import 'package:movie_clean/movies/domain/entity/movie.dart';

@immutable
class MoviesStates {
  final List<Movie> nowPlayingList;

  final AppStates nowPlayingState;

  final List<Movie> slider1List;

  final AppStates slider1State;

  const MoviesStates({
    this.nowPlayingState = AppStates.loading,
    this.nowPlayingList = const [],
    this.slider1List = const [],
    this.slider1State = AppStates.loading,
  });
}

enum AppStates { loading, suc, error }
