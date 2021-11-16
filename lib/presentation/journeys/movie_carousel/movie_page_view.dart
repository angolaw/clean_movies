import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/screenutil/screen_util.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/presentation/journeys/movie_carousel/movie_card_widget.dart';
import 'package:flutter/material.dart';

import 'animated_movie_card_widget.dart';

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
  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
        initialPage: widget.defaultIndex,
        keepPage: false,
        viewportFraction: 0.7);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h.toDouble()),
      height: ScreenUtil.screenHeight * 0.35,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final MovieEntity movie = widget.movies[index]!;
          return AnimatedMovieCardWidget(
            movieId: movie.id,
            posterPath: movie.posterPath,
            index: index,
            pageController: _pageController,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length ?? 0,
        onPageChanged: (index) {},
      ),
    );
  }
}
