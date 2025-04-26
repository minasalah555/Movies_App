import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/data/repos/home_repo.dart';
import 'package:movies_app/Features/Home/presentation/manager/populer_movie_cubit/populer_movies_state.dart';

class PopulermoviesCubit extends Cubit<PopulermoviesState> {
  PopulermoviesCubit(this.homeRepo) : super(PopulermoviesInitial());
  HomeRepo homeRepo;
  getPopulerMovies() async {
    emit(PopulermoviesLoading());
    var data = await homeRepo.getPopulerMovies();
    data.fold(
      (failure) {
        emit(PopulermoviesFailure(errMessage: failure.errMessage));
      },
      (movies) {
        emit(PopulermoviesSuccess(populerMovies: movies));
      },
    );
  }
}
