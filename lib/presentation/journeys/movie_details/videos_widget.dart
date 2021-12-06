import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/presentation/blocs/videos/videos_bloc.dart';
import 'package:clean_movies/presentation/journeys/watch_video/watch_video_screen.dart';
import 'package:clean_movies/presentation/journeys/watch_video/watch_videos_arguments.dart';
import 'package:clean_movies/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({
    Key? key,
    required this.videosBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Button(
            text: TranslationsConstants.watchTrailers,
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.watchVideo,
                  arguments: WatchVideosArguments(videos: _videos));
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
