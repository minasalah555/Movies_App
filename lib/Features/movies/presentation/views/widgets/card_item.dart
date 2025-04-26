import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/utils/go_route.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(APiGoRouter.movieDetail, extra: movieModel);
      },
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${movieModel.movieImage}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              movieModel.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white.withOpacity(0.6),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
