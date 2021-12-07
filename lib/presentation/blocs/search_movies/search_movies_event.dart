part of 'search_movies_bloc.dart';

abstract class SearchMoviesEvent extends Equatable {
  const SearchMoviesEvent();

  @override
  List<Object> get props => [];
}

class SearchMovieEvent extends SearchMoviesEvent {
  final String searchTerm;

  const SearchMovieEvent({required this.searchTerm});
  @override
  List<Object> get props => [searchTerm];
}
