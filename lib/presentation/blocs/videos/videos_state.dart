part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}

class NoVideos extends VideosState {}

class VideosLoaded extends VideosState {
  final List<MovieEntity?> movies;
  const VideosLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}
