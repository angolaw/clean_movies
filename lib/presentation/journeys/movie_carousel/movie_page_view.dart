import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:flutter/material.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity?> movies;
  final int defaultIndex;
  const MoviePageView(
      {Key? key, required this.movies, required this.defaultIndex})
      : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
