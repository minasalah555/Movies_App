import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Features/Home/presentation/manager/similer_movie_cubit/similer_movie_cubit.dart';
import 'package:movies_app/Features/Home/presentation/views/widgets/movie_detials_view_body.dart';
import 'package:movies_app/core/models/movie_model.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilerMovieCubit>(
      context,
    ).getSimilerMovies(id: widget.movieModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movieModel.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      body: MovieDetailsViewBody(movieModel: widget.movieModel),
    );
  }
}
