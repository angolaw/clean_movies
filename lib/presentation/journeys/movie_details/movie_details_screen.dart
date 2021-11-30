import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/presentation/blocs/cast/cast_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'big_poster.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieDetailsArgument movieDetailsArgument;
  const MovieDetailsScreen({Key? key, required this.movieDetailsArgument})
      : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailBloc? movieDetailBloc;
  CastBloc? _castBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = movieDetailBloc?.castBloc;
    movieDetailBloc?.add(
        MovieDetailLoadEvent(movieId: widget.movieDetailsArgument.movieId));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    movieDetailBloc?.close();
    _castBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<MovieDetailBloc>.value(
            value: movieDetailBloc!,
          ),
          BlocProvider<CastBloc>.value(value: _castBloc!)
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              return SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      BigPoster(movie: state.movieDetailEntity),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16.w.toDouble(),
                          vertical: Sizes.dimen_8.h.toDouble(),
                        ),
                        child: Text(state.movieDetailEntity.overview!,
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.dimen_16.w.toDouble(),
                          ),
                          child: Text(TranslationsConstants.cast.t(context),
                              style: Theme.of(context).textTheme.headline6))
                    ]),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: (context, state) {
        if (state is CastLoaded) {
          return Container();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
