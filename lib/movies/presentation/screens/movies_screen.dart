import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/movies/presentation/controller/bLoC.dart';
import 'package:movie_clean/movies/presentation/controller/movies_events.dart';
import 'package:movie_clean/movies/presentation/controller/movies_states.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesbLoC, MoviesStates>(
      builder: (BuildContext context, state) {
        print(state.listOfMovies);

        return Scaffold(
          body: MaterialButton(
            color: Colors.black,
              onPressed: (){

          }) ,
        );

      },
    );
  }
}
