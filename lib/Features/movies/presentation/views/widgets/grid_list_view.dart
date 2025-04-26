import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/presentation/manager/up_comming_movies/up_comming_movies_cubit.dart';
import 'package:movies_app/Features/Home/presentation/manager/up_comming_movies/up_comming_movies_state.dart';
import 'package:movies_app/Features/movies/presentation/views/widgets/card_item.dart';
import 'package:movies_app/core/widgets/custom_error_widget.dart';
import 'package:movies_app/core/widgets/custom_loading_widget.dart';

class ListGridView extends StatelessWidget {
  const ListGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpCommingMoviesCubit, UpCommingMoviesState>(
      builder: (context, state) {
        if (state is UpCommingMoviesSuccess) {
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 3 / 4,
            ),
            itemCount: state.populerMovies.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: CardItem(movieModel: state.populerMovies[index]),
              );
            },
          );
        } else if (state is UpCommingMoviesFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
}
