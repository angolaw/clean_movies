part of 'moviebackdrop_bloc.dart';

abstract class MoviebackdropState extends Equatable {
  const MoviebackdropState();

  @override
  List<Object> get props => [];
}

class MoviebackdropInitial extends MoviebackdropState {}

class MoviebackdropChanged extends MoviebackdropState {
  final MovieEntity movie;
  const MoviebackdropChanged({required this.movie});

  @override
  List<Object> get props => [movie];
}
