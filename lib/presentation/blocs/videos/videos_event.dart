part of 'videos_bloc.dart';

abstract class VideosEvent extends Equatable {
  const VideosEvent();

  @override
  List<Object> get props => [];
}

class LoadedVideosEvent extends VideosEvent {
  final int movieId;

  const LoadedVideosEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
