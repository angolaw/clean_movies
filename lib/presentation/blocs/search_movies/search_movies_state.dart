part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesError extends SearchMoviesState {
  final AppErrorType errorType;

  SearchMoviesError({required this.errorType});

  @override
  List<Object> get props => [errorType];
}

class SearchMoviesCompleted extends SearchMoviesState {
  final List<MovieEntity?> movies;

  SearchMoviesCompleted({required this.movies});

  @override
  List<Object> get props => [movies];
}
