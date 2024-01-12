import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_clean/movies/presentation/controller/bLoC.dart';
import 'package:movie_clean/movies/presentation/controller/movies_events.dart';
import 'package:movie_clean/movies/presentation/screens/movies_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(

          create: (BuildContext context) => MoviesbLoC()..add(GetNowPlayingEvent()) ,
          child: const MoviesScreen()),
    );
  }
}

