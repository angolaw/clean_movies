import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/entities/movie_search_params.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity?>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies({required this.repository});
  @override
  Future<Either<AppError, List<MovieEntity?>>> call(
      MovieSearchParams params) async {
    return await repository.getSearchedMovies(params.searchTerm);
  }
}
