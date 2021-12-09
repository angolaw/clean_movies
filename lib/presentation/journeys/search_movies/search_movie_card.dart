import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/data/core/api_constants.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_argument.dart';
import 'package:clean_movies/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

class SearchMovieCard extends StatelessWidget {
  //1
  final MovieEntity movie;

  const SearchMovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2
    return GestureDetector(
      onTap: () {
        //3
        Navigator.of(context).pushNamed(RouteList.movieDetail,
            arguments: MovieDetailsArgument(movieId: movie.id));
      },
      //4
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16.w,
          vertical: Sizes.dimen_2.h,
        ),
        //5
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.dimen_8.w),
              //6
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizes.dimen_4.w),
                child: CachedNetworkImage(
                  imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                  width: Sizes.dimen_80.w,
                ),
              ),
            ),
            //7
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //8
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  //9
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.greyCaption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
