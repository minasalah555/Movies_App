import 'package:movies_app/core/models/movie_model.dart';

abstract class PopulermoviesState {}

class PopulermoviesInitial extends PopulermoviesState {}

class PopulermoviesLoading extends PopulermoviesState {}

class PopulermoviesFailure extends PopulermoviesState {
  final String errMessage;

  PopulermoviesFailure({required this.errMessage});
}

class PopulermoviesSuccess extends PopulermoviesState {
  List<MovieModel> populerMovies;
  PopulermoviesSuccess({required this.populerMovies});
}
