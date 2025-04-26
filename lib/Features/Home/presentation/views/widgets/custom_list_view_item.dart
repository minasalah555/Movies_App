import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/core/models/movie_model.dart';
import 'package:movies_app/core/utils/go_route.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.movieModel});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.height * 0.26,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(
              context,
            ).push(APiGoRouter.movieDetail, extra: movieModel);
          },
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://image.tmdb.org/t/p/w500/${movieModel.movieImage}',
                    fit: BoxFit.fitHeight,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              Center(
                child: Text(
                  movieModel.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.6),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
