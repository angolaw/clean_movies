import 'package:clean_movies/presentation/journeys/movie_tabs/tab.dart';

class MovieTabbedConstants {
  static const List<Tab> movieTabs = <Tab>[
    Tab(
      index: 0,
      title: 'Popular',
    ),
    Tab(
      index: 1,
      title: 'Now',
    ),
    Tab(
      index: 2,
      title: 'Soon',
    ),
  ];
}
