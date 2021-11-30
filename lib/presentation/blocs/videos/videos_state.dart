part of 'videos_bloc.dart';

abstract class VideosState extends Equatable {
  const VideosState();
  
  @override
  List<Object> get props => [];
}

class VideosInitial extends VideosState {}
