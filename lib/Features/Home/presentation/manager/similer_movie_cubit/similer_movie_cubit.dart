import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo.dart';

import 'package:movies_app/Features/Home/presentation/manager/similer_movie_cubit/similer_movie_state.dart';

class SimilerMovieCubit extends Cubit<SimilerMovieState> {
  SimilerMovieCubit(this.homeRepo) : super(SimilerrMoviesInitial());
  HomeRepo homeRepo;
  getSimilerMovies({required int id}) async {
    print('getSimilerMovies\n');
    emit(SimilerMoviesLoading());
    var data = await homeRepo.getSimilerMovies(id: id);
    data.fold(
      (failure) {
        emit(SimilerMoviesFailure(errMessage: failure.errMessage));
      },
      (movies) {
        emit(SimilerMoviesSuccess(similerMovies: movies));
      },
    );
  }
}
