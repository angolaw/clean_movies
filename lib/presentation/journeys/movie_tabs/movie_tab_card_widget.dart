import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/data/core/api_constants.dart';
import 'package:flutter/material.dart';

class MovieTabCardWidget extends StatelessWidget {
  final int movieId;
  final String title, posterPath;
  const MovieTabCardWidget(
      {Key? key,
      required this.movieId,
      required this.title,
      required this.posterPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_10.w.toDouble()),
              child: CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}$posterPath',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h.toDouble()),
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          )
        ],
      ),
    );
  }
}
