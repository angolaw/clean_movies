import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/presentation/journeys/movie_tabs/movie_tab_card_widget.dart';
import 'package:flutter/material.dart';

class MovieListViewBuilder extends StatelessWidget {
  final List<MovieEntity?> movies;

  const MovieListViewBuilder({Key? key, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h.toDouble()),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final MovieEntity movie = movies[index]!;
            print("Thy movie ${movie.id}");
            return MovieTabCardWidget(
                movieId: movie.id,
                title: movie.title,
                posterPath: movie.posterPath);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 14.w.toDouble(),
            );
          },
          itemCount: movies.length),
    );
  }
}
