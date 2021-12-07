import 'package:clean_movies/presentation/blocs/movie_backdrop/moviebackdrop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDataWidget extends StatelessWidget {
  const MovieDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviebackdropBloc, MoviebackdropState>(
        builder: (context, state) {
      if (state is MoviebackdropChanged) {
        return Text(
          state.movie.title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: Theme.of(context).textTheme.headline6,
        );
      }
      return const SizedBox.shrink();
    });
  }
}
