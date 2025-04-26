import 'package:movies_app/core/models/movie_model.dart';

sealed class UpCommingMoviesState {}

class UpCommingMoviesInitial extends UpCommingMoviesState {}

class UpCommingMoviesLoading extends UpCommingMoviesState {}

class UpCommingMoviesFailure extends UpCommingMoviesState {
  final String errMessage;

  UpCommingMoviesFailure({required this.errMessage});
}

class UpCommingMoviesSuccess extends UpCommingMoviesState {
  List<MovieModel> populerMovies;
  UpCommingMoviesSuccess({required this.populerMovies});
}
