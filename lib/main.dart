import 'dart:async';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:clean_movies/presentation/movie_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'di/get_it.dart' as getIt;
import 'package:hive/hive.dart';

Future<void> main() async {
  //! SEM INJEÇÃO DE DEPENDENCIAS
  // //1 - Iniciando a ApiClient
  // ApiClient client = ApiClient(Client());
  // //2 - Instanciando o datasource e passando a instancia do cliente
  // MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(client);
  // //3 - Instanciando o repository e passando a instancia do datasource
  // MovieRepository repository = MovieRepositoryImpl(dataSource);
  // //4 - Instanciando o usecase e passando o repository
  // GetTrending getTrending = GetTrending(repository);
  // GetComingSoon getComingSoon = GetComingSoon(repository);
  // GetPopular getPopular = GetPopular(repository);
  // GetPlayingNow getPlayingNow = GetPlayingNow(repository);
  // //5 - Executando o usecase
  // //getTrending();
  // //6 - Folding o result do either no usecase
  // final Either<AppError, List<MovieEntity?>> eitherTrending =
  //     await getTrending(NoParams());
  // final Either<AppError, List<MovieEntity?>> eitherGetComingSoon =
  //     await getComingSoon(NoParams());
  // final Either<AppError, List<MovieEntity?>> eitherGetPopular =
  //     await getPopular(NoParams());
  // final Either<AppError, List<MovieEntity?>> eitherGetPlayingNow =
  //     await getPlayingNow(NoParams());
  // eitherTrending.fold(
  //   (l) {
  //     print("Deu erro meo");
  //     print(l.message);
  //   },
  //   (r) {
  //     print("TRENDING");
  //     print(r);
  //   },
  // );
  // eitherGetComingSoon.fold(
  //   (l) {
  //     print("Deu erro meo");
  //     print(l.message);
  //   },
  //   (r) {
  //     print("COMING SOON");
  //     print(r);
  //   },
  // );
  // eitherGetPopular.fold(
  //   (l) {
  //     print("Deu erro meo");
  //     print(l.message);
  //   },
  //   (r) {
  //     print("POPULAR");
  //     print(r);
  //   },
  // );
  // eitherGetPlayingNow.fold(
  //   (l) {
  //     print("Deu erro meo");
  //     print(l.message);
  //   },
  //   (r) {
  //     print("PLAYING NOW");
  //     print(r);
  //   },
  // );

  //! USANDO INJEÇÃO DE DEPENDENCIAS
  // unawaited(getIt.init());
  // GetTrending getTrending = getIt.getItInstance<GetTrending>();
  // final Either<AppError, List<MovieEntity?>> eitherTrending =
  //     await getTrending(NoParams());
  // eitherTrending.fold(
  //   (l) {
  //     print("Deu erro meo");
  //     print(l.message);
  //   },
  //   (r) {
  //     print("TRENDING");
  //     print(r);
  //   },
  // );

  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());

  //* HIVE init
  final appDocumentsDir =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentsDir.path);

  runApp(const MovieApp());
}
