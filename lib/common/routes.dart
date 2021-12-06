import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/presentation/journeys/favorite/favorite_screen.dart';
import 'package:clean_movies/presentation/journeys/home/home_screen.dart';
import 'package:clean_movies/presentation/journeys/login/login_screen.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_argument.dart';
import 'package:clean_movies/presentation/journeys/movie_details/movie_details_screen.dart';
import 'package:clean_movies/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:clean_movies/presentation/journeys/watch_video/watch_videos_arguments.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings settings) => {
        RouteList.initial: (context) => LoginScreen(),
        RouteList.home: (context) => HomeScreen(),
        RouteList.movieDetail: (context) => MovieDetailsScreen(
              movieDetailsArgument: settings.arguments as MovieDetailsArgument,
            ),
        RouteList.watchVideo: (context) => WatchVideoScreen(
              watchVideoArguments: settings.arguments as WatchVideosArguments,
            ),
        RouteList.favorite: (context) => FavoriteScreen(),
      };
}
