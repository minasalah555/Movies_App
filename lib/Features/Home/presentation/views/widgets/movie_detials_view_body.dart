import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/presentation/manager/similer_movie_cubit/similer_movie_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/similer_movie_cubit/similer_movie_state.dart';
import 'package:movies_app/Features/Home/presentation/views/widgets/custom_list_view.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_widget.dart';

class MovieDetailsViewBody extends StatelessWidget {
  const MovieDetailsViewBody({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movieModel.movieImage}',
                height: 200,
                errorWidget:
                    (context, url, error) => Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(height: 10),
            Text(
              movieModel.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            Text(
              movieModel.overview,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white.withOpacity(0.6),
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 10),
            Text(
              'Adult +18 : ${movieModel.adult ? 'Yes' : 'No'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Release : ${movieModel.releaseDate}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Rate : ${movieModel.voteAverage}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Language : ${movieModel.language}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            Text(
              'Similer',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<SimilerMovieCubit, SimilerMovieState>(
              builder: (context, state) {
                if (state is SimilerMoviesSuccess) {
                  return CustomListView(movies: state.similerMovies);
                } else if (state is SimilerMoviesFailure) {
                  return CustomErrorWidget(errMessage: state.errMessage);
                } else {
                  return CustomLoadingWidget();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
