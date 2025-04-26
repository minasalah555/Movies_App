import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo.dart';
import 'package:movies_app/Features/Home/presentation/manager/top_reted_movie_cubit/top_reted_movie_state.dart';

class TopRetedMovieCubit extends Cubit<TopRetedMovieState> {
  TopRetedMovieCubit(this.homeRepo) : super(TopRetedMovieInitial());
  HomeRepo homeRepo;
  getPopulerMovies() async {
    emit(TopRetedMovieLoading());
    var data = await homeRepo.getTopReatedMovies();
    data.fold(
      (failure) {
        emit(TopRetedMovieFailure(errMessage: failure.errMessage));
      },
      (movies) {
        emit(TopRetedMovieSuccess(populerMovies: movies));
      },
    );
  }
}
