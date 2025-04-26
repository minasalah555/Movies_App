import 'package:movies_app/core/models/movie_model.dart';

abstract class SimilerMovieState {}

class SimilerrMoviesInitial extends SimilerMovieState {}

class SimilerMoviesLoading extends SimilerMovieState {}

class SimilerMoviesFailure extends SimilerMovieState {
  final String errMessage;

  SimilerMoviesFailure({required this.errMessage});
}

class SimilerMoviesSuccess extends SimilerMovieState {
  List<MovieModel> similerMovies;
  SimilerMoviesSuccess({required this.similerMovies});
}
