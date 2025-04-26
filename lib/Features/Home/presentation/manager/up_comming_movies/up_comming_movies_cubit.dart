import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo.dart';
import 'package:movies_app/Features/Home/presentation/manager/up_comming_movies/up_comming_movies_state.dart';

class UpCommingMoviesCubit extends Cubit<UpCommingMoviesState> {
  UpCommingMoviesCubit(this.homeRepo) : super(UpCommingMoviesInitial());
  HomeRepo homeRepo;
  getPopulerMovies() async {
    emit(UpCommingMoviesLoading());
    var data = await homeRepo.getUpComingMovies();
    data.fold(
      (failure) {
        emit(UpCommingMoviesFailure(errMessage: failure.errMessage));
      },
      (movies) {
        emit(UpCommingMoviesSuccess(populerMovies: movies));
      },
    );
  }
}
