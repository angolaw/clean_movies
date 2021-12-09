import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/data/core/api_constants.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:clean_movies/presentation/blocs/favorite_cubit/favorite_cubit.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;
  const FavoriteMovieCardWidget({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_8.h.toDouble()),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8.w.toDouble()),
      ),
      //7
      child: GestureDetector(
        onTap: () {
          //* DEPOIS
          Navigator.of(context).pushNamed(RouteList.movieDetail,
              arguments: MovieDetailsArgument(movieId: movie.id));

          //* ANTES
        },
        //6
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8.w.toDouble()),
          //3
          child: Stack(
            children: <Widget>[
              //4
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_100.h.toDouble(),
              ),
              //5
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    print("movie: ${movie.id}");
                    BlocProvider.of<FavoriteCubit>(context)
                        .deleteFavoriteMovie(MovieParams(id: movie.id));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.dimen_12.w.toDouble()),
                    child: Icon(
                      Icons.delete,
                      size: Sizes.dimen_12.h.toDouble(),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
