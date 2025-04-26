import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/presentation/manager/top_reted_movie_cubit/top_reted_movie_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/top_reted_movie_cubit/top_reted_movie_state.dart';
import 'package:movies_app/Features/Home/presentation/manager/up_comming_movies/up_comming_movies_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/up_comming_movies/up_comming_movies_state.dart';
import 'package:movies_app/Features/Home/presentation/views/widgets/custom_list_view.dart';
import 'package:movies_app/Features/Home/presentation/views/widgets/movie_slider.dart';
import 'package:movies_app/core/utils/init_state_widget.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Popular Movies ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20),

              const MovieSlider(),

              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Top Rated Movies ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<TopRetedMovieCubit, TopRetedMovieState>(
                builder: (context, state) {
                  if (state is TopRetedMovieSuccess) {
                    return CustomListView(movies: state.populerMovies);
                  } else if (state is TopRetedMovieFailure) {
                    return CustomErrorWidget(errMessage: state.errMessage);
                  } else {
                    return CustomLoadingWidget();
                  }
                },
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'UpComing Movies ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<UpCommingMoviesCubit, UpCommingMoviesState>(
                builder: (context, state) {
                  if (state is UpCommingMoviesSuccess) {
                    return CustomListView(movies: state.populerMovies);
                  } else if (state is UpCommingMoviesFailure) {
                    return CustomErrorWidget(errMessage: state.errMessage);
                  } else {
                    return CustomLoadingWidget();
                  }
                },
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
