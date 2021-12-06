import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class FavoriteMoviesGridView extends StatelessWidget {
  final List<MovieEntity> movies;
  const FavoriteMoviesGridView({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w.toDouble()),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: Sizes.dimen_16.w.toDouble(),
        ),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return FavoriteMovieCardWidget(
            movie: movie,
          );
        },
      ),
    );
  }
}
