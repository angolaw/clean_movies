import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  final int id;
  final String title;
  final String posterPath;

  MovieTable({required this.id, required this.title, required this.posterPath})
      : super(
            id: id,
            title: title,
            posterPath: posterPath,
            backdropPath: '',
            voteAverage: 0,
            releaseDate: '',
            overview: '');
}
