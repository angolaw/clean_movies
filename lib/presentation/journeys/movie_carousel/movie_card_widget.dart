import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/data/core/api_constants.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_argument.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;
  const MovieCardWidget(
      {Key? key, required this.movieId, required this.posterPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 32,
      borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
      child: GestureDetector(
          onTap: () {
            //* DEPOIS
            Navigator.of(context).pushNamed(RouteList.movieDetail,
                arguments: MovieDetailsArgument(movieId: movieId));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
            child: CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
