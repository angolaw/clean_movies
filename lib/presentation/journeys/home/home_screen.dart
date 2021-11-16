import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/presentation/blocs/movie_carousel/moviecarousel_bloc.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MoviecarouselBloc? moviecarouselBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviecarouselBloc = getItInstance<MoviecarouselBloc>();
    moviecarouselBloc?.add(CarouselLoadEvent(defaultIndex: 0));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    moviecarouselBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: const [
          FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.6,
            child: Placeholder(
              color: Colors.grey,
            ),
          ),
          FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 0.4,
            child: Placeholder(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}