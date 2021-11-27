import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatefulWidget {
  final MovieDetailsArgument movieDetailsArgument;
  const MovieDetailsScreen({Key? key, required this.movieDetailsArgument})
      : super(key: key);

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailBloc? movieDetailBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieDetailBloc = getItInstance<MovieDetailBloc>();
    movieDetailBloc?.add(
        MovieDetailLoadEvent(movieId: widget.movieDetailsArgument.movieId));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    movieDetailBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MovieDetailBloc>.value(
        value: movieDetailBloc!,
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              return Container();
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
