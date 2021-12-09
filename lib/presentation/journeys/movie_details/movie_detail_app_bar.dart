import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/domain/entities/movie_detail_entity.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/presentation/blocs/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailAppBar({Key? key, required this.movieDetailEntity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //4
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //2
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        ),
        BlocBuilder<FavoriteCubit, FavoriteState>(builder: (context, state) {
          if (state is IsFavoriteMovie) {
            return GestureDetector(
              onTap: () {
                BlocProvider.of<FavoriteCubit>(context).toggleFavoriteMovie(
                    MovieEntity.fromMovieDetailEntity(movieDetailEntity),
                    state.isMovieFavorite);
              },
              child: Icon(
                state.isMovieFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              ),
            );
          } else {
            return Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: Sizes.dimen_12.h,
            );
          }
        })
        //3
      ],
    );
  }
}
