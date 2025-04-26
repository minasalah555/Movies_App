import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/Home/presentation/manager/top_reted_movie_cubit/top_reted_movie_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/top_reted_movie_cubit/top_reted_movie_state.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/utils/go_route.dart';
import 'package:movies_app/core/utils/init_state_widget.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SearchViewBody()));
  }
}

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  String value = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: InitStateWidget(
            onSubmitted: (value) {
              setState(() {
                this.value = value;
              });
            },
          ),
        ),
        ListMoviesSearch(value: value),
      ],
    );
  }
}

class ListMoviesSearch extends StatelessWidget {
  const ListMoviesSearch({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRetedMovieCubit, TopRetedMovieState>(
      builder: (context, state) {
        if (state is TopRetedMovieSuccess) {
          final filteredMovies =
              state.populerMovies
                  .where(
                    (movie) =>
                        movie.title.toLowerCase().contains(value.toLowerCase()),
                  )
                  .toList();

          if (filteredMovies.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Text("No movies found.", style: TextStyle(fontSize: 20)),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: filteredMovies.length,
              itemBuilder: (context, index) {
                return CustomSearchListItem(movie: filteredMovies[index]);
              },
            ),
          );
        } else if (state is TopRetedMovieFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
}

class CustomSearchListItem extends StatelessWidget {
  const CustomSearchListItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        GoRouter.of(context).push(APiGoRouter.movieDetail, extra: movie);
      },
      leading: CachedNetworkImage(
        height: 100,
        width: 100,
        imageUrl: 'https://image.tmdb.org/t/p/w500${movie.movieImage}',
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      title: Text(
        movie.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        movie.overview,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
