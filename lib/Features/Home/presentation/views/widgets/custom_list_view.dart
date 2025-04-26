import 'package:flutter/material.dart';
import 'package:movies_app/Features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:movies_app/core/models/movie_model.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.movies});
  final List<MovieModel> movies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return CustomListViewItem(movieModel: movies[index]);
        },
      ),
    );
  }
}
