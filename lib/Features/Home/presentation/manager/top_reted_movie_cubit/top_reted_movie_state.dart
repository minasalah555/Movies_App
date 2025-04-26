import 'package:movies_app/core/models/movie_model.dart';

sealed class TopRetedMovieState {}

class TopRetedMovieInitial extends TopRetedMovieState {}

class TopRetedMovieLoading extends TopRetedMovieState {}

class TopRetedMovieFailure extends TopRetedMovieState {
  final String errMessage;

  TopRetedMovieFailure({required this.errMessage});
}

class TopRetedMovieSuccess extends TopRetedMovieState {
  List<MovieModel> populerMovies;
  TopRetedMovieSuccess({required this.populerMovies});
}
