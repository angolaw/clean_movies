// ignore_for_file: sized_box_for_whitespace

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/data/core/api_constants.dart';
import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/presentation/blocs/cast/cast_bloc.dart';
import 'package:clean_movies/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:clean_movies/presentation/blocs/favorite_cubit/favorite_cubit.dart';
import 'package:clean_movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:clean_movies/presentation/blocs/theme/theme_cubit.dart';
import 'package:clean_movies/presentation/blocs/videos/videos_bloc.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_argument.dart';
import 'package:clean_movies/presentation/journeys/movie_details/videos_widget.dart';
import 'package:clean_movies/presentation/themes/theme_text.dart';
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
  VideosBloc? _videosBloc;
  FavoriteCubit? favoriteCubit;

  @override
  void initState() {
    super.initState();
    movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castBloc = movieDetailBloc?.castBloc;
    _videosBloc = movieDetailBloc?.videosBloc;
    favoriteCubit = movieDetailBloc?.favoriteCubit;
    movieDetailBloc?.add(
        MovieDetailLoadEvent(movieId: widget.movieDetailsArgument.movieId));
  }

  @override
  void dispose() {
    movieDetailBloc?.close();
    _castBloc?.close();
    _videosBloc?.close();
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
          BlocProvider<CastBloc>.value(value: _castBloc!),
          BlocProvider<VideosBloc>.value(value: _videosBloc!),
          BlocProvider<FavoriteCubit>.value(value: favoriteCubit!),
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
                          horizontal: Sizes.dimen_16.w,
                          vertical: Sizes.dimen_8.h,
                        ),
                        child: Text(state.movieDetailEntity.overview!,
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_16.w,
                        ),
                        child: Text(TranslationsConstants.cast.t(context),
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      const CastWidget(),
                      VideosWidget(videosBloc: _videosBloc!)
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
    return BlocBuilder<CastBloc, CastState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return Container(
            height: Sizes.dimen_100.h,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.cast.length,
                itemBuilder: (context, index) {
                  final castEntity = state.cast[index];
                  return Container(
                    height: Sizes.dimen_100.h,
                    width: Sizes.dimen_160.w,
                    //2
                    child: Card(
                      elevation: 1,
                      margin: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_8.w,
                        vertical: Sizes.dimen_4.h,
                      ),
                      //3
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(Sizes.dimen_8.w),
                        ),
                      ),
                      //4
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //6
                          Expanded(
                            //7
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(8.w),
                              ),
                              //5
                              child: CachedNetworkImage(
                                height: Sizes.dimen_100.h,
                                width: Sizes.dimen_160.w,
                                imageUrl:
                                    '${ApiConstants.BASE_IMAGE_URL}${castEntity!.posterPath}',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          //proxima adicao
                          //2
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.dimen_8.w,
                            ),
                            //1
                            child: Text(
                              castEntity.name,
                              overflow: TextOverflow.fade,
                              maxLines: 1,
                              style: context.read<ThemeCubit>().state ==
                                      Themes.dark
                                  ? Theme.of(context).textTheme.vulcanBodyText2
                                  : Theme.of(context).textTheme.whiteBodyText2,
                            ),
                          ),
                          //4
                          Padding(
                            padding: EdgeInsets.only(
                              left: Sizes.dimen_8.w,
                              right: Sizes.dimen_8.w,
                              bottom: Sizes.dimen_2.h,
                            ),
                            //3
                            child: Text(
                              castEntity.character,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
