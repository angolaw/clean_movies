import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:clean_movies/presentation/journeys/favorite/favorite_movies_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  FavoriteBloc? favoriteBloc;

  @override
  void initState() {
    super.initState();
    favoriteBloc = getItInstance<FavoriteBloc>();
    favoriteBloc?.add(LoadFavoriteEvent());
  }

  @override
  void dispose() {
    super.dispose();
    favoriteBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationsConstants.favoriteMovies.t(context)),
      ),
      body: BlocProvider<FavoriteBloc>.value(
        value: favoriteBloc!,
        child:
            BlocBuilder<FavoriteBloc, FavoriteState>(builder: (context, state) {
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
            return FavoriteMoviesGridView(movies: state.movies);
          } else {
            return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
