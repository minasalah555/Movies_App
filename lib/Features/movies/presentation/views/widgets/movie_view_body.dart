import 'package:flutter/material.dart';
import 'package:movies_app/Features/movies/presentation/views/widgets/grid_list_view.dart';

class MovieViewBody extends StatelessWidget {
  const MovieViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListGridView(),
    );
  }
}
