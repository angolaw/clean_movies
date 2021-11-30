import 'package:clean_movies/domain/entities/video_entity.dart';

class WatchVideosArguments {
  final List<VideoEntity?> videos;

  WatchVideosArguments({required this.videos});
}
