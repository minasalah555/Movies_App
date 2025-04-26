import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo_impl.dart';
import 'package:movies_app/Features/Home/presentation/manager/similer_movie_cubit/similer_movie_cubit.dart';
import 'package:movies_app/Features/Home/presentation/views/home_view.dart';
import 'package:movies_app/Features/Home/presentation/views/movie_details.dart';
import 'package:movies_app/Features/Home/presentation/views/search_view.dart';
import 'package:movies_app/Features/splech/presentation/views/splech_view.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/utils/services_locator.dart';

abstract class APiGoRouter {
  // GoRouter configuration
  static const movieDetail = '/movieDetail';
  static const movieSearch = '/movieSearch';
  static const homeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => SplechView()),
      GoRoute(path: homeView, builder: (context, state) => HomeView()),
      GoRoute(
        path: movieDetail,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilerMovieCubit(getIt.get<HomeRepoImpl>()),
              child: MovieDetailsView(movieModel: state.extra as MovieModel),
            ),
      ),
      GoRoute(path: movieSearch, builder: (context, state) => SearchView()),
    ],
  );
}
