import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_clean/movies/core/end_points.dart';
import 'package:movie_clean/movies/presentation/controller/bLoC.dart';
import 'package:movie_clean/movies/presentation/controller/movies_states.dart';
import 'package:movie_clean/movies/presentation/screens/dummy.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopReatedComponent extends StatelessWidget {
  const TopReatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesbLoC, MoviesStates>(
      builder: (BuildContext context, state) {
        switch (state.topRatedState) {
          case AppStates.loading:
            return const CircularProgressIndicator();
          case AppStates.suc:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedList.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedList[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                          child: CachedNetworkImage(
                            width: 120.0,
                            fit: BoxFit.cover,
                            imageUrl:
                            ApiEndPoints.imageUrl(movie.backdropPath!),
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[850]!,
                              highlightColor: Colors.grey[800]!,
                              child: Container(
                                height: 170.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case AppStates.error:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
