part of 'moviebackdrop_bloc.dart';

abstract class MoviebackdropEvent extends Equatable {
  const MoviebackdropEvent();

  @override
  List<Object> get props => [];
}

class MovieBackdropChangedEvent extends MoviebackdropEvent {
  final MovieEntity movie;

  MovieBackdropChangedEvent({required this.movie});
  @override
  List<Object> get props => [movie];
}
