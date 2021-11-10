import 'movie_model.dart';

class MoviesResultModel {
  final List<MovieModel>? movies;

  MoviesResultModel({this.movies});

  factory MoviesResultModel.fromJson(Map<String, dynamic> json) {
    List tempMovies = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        tempMovies.add(MovieModel.fromJson(v));
      });
    }

    return MoviesResultModel(movies: tempMovies as List<MovieModel>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (movies != null) {
      data['results'] = movies?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
