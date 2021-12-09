import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/presentation/blocs/favorite_cubit/favorite_cubit.dart';
import 'package:clean_movies/presentation/journeys/favorite/favorite_movies_grid_view.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteCubit? favoriteCubit;
  @override
  void initState() {
    super.initState();
    favoriteCubit = getItInstance<FavoriteCubit>();
    favoriteCubit?.loadFavoriteMovie();
  }

  @override
  void dispose() {
    super.dispose();
    favoriteCubit?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.vulcan,
        title: Text(TranslationsConstants.favoriteMovies.t(context)),
      ),
      body: BlocProvider<FavoriteCubit>.value(
        value: favoriteCubit!,
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
          if (state is FavoriteMoviesLoaded) {
            if (state.movies.isEmpty) {
              return Center(
                child: Text(
                  TranslationsConstants.noFavoriteMovies.t(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: Sizes.dimen_8),
              child: FavoriteMoviesGridView(movies: state.movies),
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
