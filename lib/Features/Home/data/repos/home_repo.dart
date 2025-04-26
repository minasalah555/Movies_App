import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/models/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> getPopulerMovies();
  Future<Either<Failure, List<MovieModel>>> getTopReatedMovies();
  Future<Either<Failure, List<MovieModel>>> getUpComingMovies();
  Future<Either<Failure, List<MovieModel>>> getSimilerMovies({required int id});
}
