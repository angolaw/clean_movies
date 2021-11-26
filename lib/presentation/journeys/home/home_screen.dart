import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/presentation/blocs/movie_backdrop/moviebackdrop_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_carousel/moviecarousel_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_tab/movietab_bloc.dart';
import 'package:clean_movies/presentation/journeys/movie_carousel/movie_carousel_widget.dart';
import 'package:clean_movies/presentation/journeys/movie_tabs/movie_tabbed_widget.dart';
import 'package:clean_movies/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MoviecarouselBloc? movieCarouselBloc;
  MoviebackdropBloc? moviebackdropBloc;
  MovieTabBloc? movieTabBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieCarouselBloc = getItInstance<MoviecarouselBloc>();
    moviebackdropBloc = movieCarouselBloc?.movieBackdropBloc;
    movieCarouselBloc?.add(CarouselLoadEvent(defaultIndex: 0));
    movieTabBloc = getItInstance<MovieTabBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    movieCarouselBloc?.close();
    moviebackdropBloc?.close();
    movieTabBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MoviecarouselBloc>(
            create: (_) => movieCarouselBloc!,
          ),
          BlocProvider<MoviebackdropBloc>(
            create: (_) => moviebackdropBloc!,
          ),
          BlocProvider<MovieTabBloc>(
            create: (_) => movieTabBloc!,
          ),
        ],
        child: Scaffold(
          drawer: const NavigationDrawer(),
          body: BlocBuilder<MoviecarouselBloc, MoviecarouselState>(
            bloc: movieCarouselBloc!,
            builder: (context, state) {
              if (state is MovieCarouselLoaded) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                        alignment: Alignment.topCenter,
                        heightFactor: 0.6,
                        child: MovieCarouselWidget(
                            movies: state.movies,
                            defaultIndex: state.defaultIndex)),
                    const FractionallySizedBox(
                        alignment: Alignment.bottomCenter,
                        heightFactor: 0.4,
                        child: MovieTabbedWidget()),
                  ],
                );
              } else if (state is MovieCarouselError) {
                return CarouselLoadErrorWidget(
                  bloc: movieCarouselBloc!,
                  errorType: state.errorType,
                );
              }
              return SizedBox.shrink();
            },
          ),
        ));
  }
}

class CarouselLoadErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final MoviecarouselBloc bloc;
  const CarouselLoadErrorWidget(
      {Key? key, required this.errorType, required this.bloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
