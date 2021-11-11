import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_movies/domain/usecases/get_popular.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/repositories/movie_repository_impl.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending.dart';
import 'domain/usecases/get_coming_soon.dart';

Future<void> main() async {
  //1 - Iniciando a ApiClient
  ApiClient client = ApiClient(Client());
  //2 - Instanciando o datasource e passando a instancia do cliente
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(client);
  //3 - Instanciando o repository e passando a instancia do datasource
  MovieRepository repository = MovieRepositoryImpl(dataSource);
  //4 - Instanciando o usecase e passando o repository
  GetTrending getTrending = GetTrending(repository);
  GetComingSoon getComingSoon = GetComingSoon(repository);
  GetPopular getPopular = GetPopular(repository);
  GetPlayingNow getPlayingNow = GetPlayingNow(repository);
  //5 - Executando o usecase
  //getTrending();
  //6 - Folding o result do either no usecase
  final Either<AppError, List<MovieEntity?>> eitherTrending =
      await getTrending(NoParams());
  final Either<AppError, List<MovieEntity?>> eitherGetComingSoon =
      await getComingSoon(NoParams());
  final Either<AppError, List<MovieEntity?>> eitherGetPopular =
      await getPopular(NoParams());
  final Either<AppError, List<MovieEntity?>> eitherGetPlayingNow =
      await getPlayingNow(NoParams());

  eitherTrending.fold(
    (l) {
      print("Deu erro meo");
      print(l.message);
    },
    (r) {
      print("TRENDING");
      print(r);
    },
  );
  eitherGetComingSoon.fold(
    (l) {
      print("Deu erro meo");
      print(l.message);
    },
    (r) {
      print("COMING SOON");
      print(r);
    },
  );
  eitherGetPopular.fold(
    (l) {
      print("Deu erro meo");
      print(l.message);
    },
    (r) {
      print("POPULAR");
      print(r);
    },
  );
  eitherGetPlayingNow.fold(
    (l) {
      print("Deu erro meo");
      print(l.message);
    },
    (r) {
      print("PLAYING NOW");
      print(r);
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
