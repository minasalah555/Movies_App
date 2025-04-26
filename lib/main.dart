import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:movies_app/Features/Home/presentation/manager/populer_movie_cubit/populer_movies_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/top_reted_movie_cubit/top_reted_movie_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/up_comming_movies/up_comming_movies_cubit.dart';
import 'package:movies_app/core/utils/go_route.dart';
import 'package:movies_app/core/utils/services_locator.dart';
// import 'package:movies_app/core/utils/api_services.dart';

void main() {
  runApp(MoviesApp());
  setup();
  // ApiServices().getMovies();
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  PopulermoviesCubit(getIt.get<HomeRepoImpl>())
                    ..getPopulerMovies(),
        ),
        BlocProvider(
          create:
              (context) =>
                  TopRetedMovieCubit(getIt.get<HomeRepoImpl>())
                    ..getPopulerMovies(),
        ),
        BlocProvider(
          create:
              (context) =>
                  UpCommingMoviesCubit(getIt.get<HomeRepoImpl>())
                    ..getPopulerMovies(),
        ),
      ],

      child: MaterialApp.router(
        routerConfig: APiGoRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey[900],
        ),
      ),
    );
  }
}
