import 'package:dartz/dartz.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo.dart';
import 'package:movies_app/core/errors/failures.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/utils/api_services.dart';
import 'dart:io';

class HomeRepoImpl implements HomeRepo {
  ApiServices apiServices;
  HomeRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, List<MovieModel>>> getPopulerMovies() async {
    try {
      var jsonData = await apiServices.getMovies(
        endPointUrl: '/popular?language=en-US&page=1',
      );
      List<MovieModel> popularMovies = [];
      for (var element in jsonData['results']) {
        popularMovies.add(MovieModel.fromJson(element));
      }
      return right(popularMovies);
    } on SocketException {
      return left(ServerFailure('No Internet Connection'));
    } on HttpException catch (e) {
      return left(ServerFailure.fromHttpException(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getTopReatedMovies() async {
    try {
      var jsonData = await apiServices.getMovies(
        endPointUrl: '/top_rated?language=en-US&page=1',
      );
      List<MovieModel> popularMovies = [];
      for (var element in jsonData['results']) {
        popularMovies.add(MovieModel.fromJson(element));
      }
      return right(popularMovies);
    } on SocketException {
      return left(ServerFailure('No Internet Connection'));
    } on HttpException catch (e) {
      return left(ServerFailure.fromHttpException(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getUpComingMovies() async {
    try {
      var jsonData = await apiServices.getMovies(
        endPointUrl: '/upcoming?language=en-US&page=1',
      );
      List<MovieModel> popularMovies = [];
      for (var element in jsonData['results']) {
        popularMovies.add(MovieModel.fromJson(element));
      }
      return right(popularMovies);
    } on SocketException {
      return left(ServerFailure('No Internet Connection'));
    } on HttpException catch (e) {
      return left(ServerFailure.fromHttpException(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getSimilerMovies({
    required int id,
  }) async {
    try {
      var jsonData = await apiServices.getMovies(
        endPointUrl: '/$id/similar?language=en-US&page=1',
      );
      List<MovieModel> popularMovies = [];
      for (var element in jsonData['results']) {
        try {
          popularMovies.add(MovieModel.fromJson(element));
        } catch (e) {
          popularMovies.add(MovieModel.fromJson(element));
          // TODO
        }
      }
      return right(popularMovies);
    } on SocketException {
      return left(ServerFailure('No Internet Connection'));
    } on HttpException catch (e) {
      return left(ServerFailure.fromHttpException(e));
    } catch (e) {
      return left(ServerFailure('Unexpected error occurred'));
    }
  }
}
