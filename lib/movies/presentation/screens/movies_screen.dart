import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/movies/presentation/controller/MoviebLoC.dart';
import 'package:movie_clean/movies/presentation/controller/bLoCEvent.dart';
import 'package:movie_clean/movies/presentation/controller/bLoCState.dart';
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(BuildContext context) {
        return MovieBloc()..add(GetNowPlayingEvent());
      } ,
      child: BlocBuilder<MovieBloc,MovieState>(
        builder: (context,state){
          print(state.soso);
          return const Scaffold();
        },
      )
    );
  }
}
