import 'package:flutter/material.dart';
import 'package:movies_app/Features/movies/presentation/views/widgets/movie_view_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UpComing Movies',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: MovieViewBody(),
    );
  }
}
