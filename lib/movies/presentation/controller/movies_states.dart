import 'package:flutter/material.dart';
import 'package:movie_clean/movies/domain/entity/movie.dart';

@immutable
class MoviesStates {
  final List<Movie> nowPlayingList;

  final AppStates nowPlayingState;

  final List<Movie> topRatedList;

  final AppStates topRatedState;

  const MoviesStates({
    this.nowPlayingState = AppStates.loading,
    this.nowPlayingList = const [],
    this.topRatedList = const [],
    this.topRatedState = AppStates.loading,
  });

  MoviesStates copyWith({
    List<Movie>? nowPlayingList,
    AppStates? nowPlayingState,
    List<Movie>? topRatedList,
    AppStates? topRatedState,
  }) {
    return MoviesStates(
        nowPlayingList: nowPlayingList ?? this.nowPlayingList,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        topRatedList: topRatedList ?? this.topRatedList,
        topRatedState: topRatedState ?? this.topRatedState);
  }
}

enum AppStates { loading, suc, error }
