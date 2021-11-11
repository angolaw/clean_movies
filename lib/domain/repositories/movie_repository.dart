import 'package:clean_movies/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity?>> getTrending();
}
