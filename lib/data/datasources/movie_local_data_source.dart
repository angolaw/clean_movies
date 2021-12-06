import 'package:clean_movies/data/tables/movie_table.dart';
import 'package:hive/hive.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getMovies();
  Future<void> deleteMovie(int movieId);
  Future<bool> checkIfMovieFavorite(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<bool> checkIfMovieFavorite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.delete(movieId);
  }

  @override
  Future<List<MovieTable>> getMovies() async {
    final movieBox = await Hive.openBox('movieBox');
    final moviesIds = movieBox.keys;
    List<MovieTable> movies = List.empty(growable: true);
    for (var id in moviesIds) {
      movies.add(movieBox.get(id));
    }
    return movies;
  }

  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    //open movieBox on hive and save movieTable
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(movieTable.id, movieTable);
  }
}
