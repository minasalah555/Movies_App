import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/Home/presentation/manager/populer_movie_cubit/populer_movies_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/populer_movie_cubit/populer_movies_state.dart';
import 'package:movies_app/core/utils/go_route.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_widget.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopulermoviesCubit, PopulermoviesState>(
      builder: (context, state) {
        if (state is PopulermoviesSuccess) {
          return CarouselSlider.builder(
            itemCount: state.populerMovies.length,
            itemBuilder: (context, index, realIndex) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(
                    APiGoRouter.movieDetail,
                    extra: state.populerMovies[index],
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500/${state.populerMovies[index].movieImage}',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 260,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              animateToClosest: true,
              autoPlayAnimationDuration: Duration(seconds: 1),
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              pageSnapping: true,
              viewportFraction: 0.8,
            ),
          );
        } else if (state is PopulermoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
}
