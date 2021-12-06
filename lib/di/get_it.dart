import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/datasources/authentication_local_data_source.dart';
import 'package:clean_movies/data/datasources/authentication_remote_data_source.dart';
import 'package:clean_movies/data/datasources/language_local_data_source.dart';
import 'package:clean_movies/data/datasources/movie_local_data_source.dart';
import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_movies/data/repositories/app_repository_impl.dart';
import 'package:clean_movies/data/repositories/authentication_repository_impl.dart';
import 'package:clean_movies/data/repositories/movie_repository_impl.dart';
import 'package:clean_movies/domain/repositories/app_repository.dart';
import 'package:clean_movies/domain/repositories/authentication_repository.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:clean_movies/domain/usecases/check_if_favorite_movie.dart';
import 'package:clean_movies/domain/usecases/delete_favorite_movie.dart';
import 'package:clean_movies/domain/usecases/get_cast.dart';
import 'package:clean_movies/domain/usecases/get_coming_soon.dart';
import 'package:clean_movies/domain/usecases/get_favorite_movies.dart';
import 'package:clean_movies/domain/usecases/get_movie_detail.dart';
import 'package:clean_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_movies/domain/usecases/get_popular.dart';
import 'package:clean_movies/domain/usecases/get_preferred_language.dart';
import 'package:clean_movies/domain/usecases/get_trending.dart';
import 'package:clean_movies/domain/usecases/get_videos.dart';
import 'package:clean_movies/domain/usecases/login_user.dart';
import 'package:clean_movies/domain/usecases/logout_user.dart';
import 'package:clean_movies/domain/usecases/save_movie.dart';
import 'package:clean_movies/domain/usecases/search_movies.dart';
import 'package:clean_movies/domain/usecases/update_language.dart';
import 'package:clean_movies/presentation/blocs/cast/cast_bloc.dart';
import 'package:clean_movies/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:clean_movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:clean_movies/presentation/blocs/login/login_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_backdrop/moviebackdrop_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_carousel/moviecarousel_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_tab/movietab_bloc.dart';
import 'package:clean_movies/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:clean_movies/presentation/blocs/videos/videos_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  //first dependency - httpClient to ApiClient
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  //movieRemoteDataSource
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  //usecases
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  // movieLocalDataSource
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  //movie repository
  getItInstance.registerLazySingleton<MovieRepository>(() =>
      MovieRepositoryImpl(
          remoteDataSource: getItInstance(), localDataSource: getItInstance()));
  //registrando o bloc
  getItInstance.registerFactory(() => MoviebackdropBloc());
  //registrando o movieBackdropBloc

  getItInstance.registerFactory(() => MoviecarouselBloc(
      loadingBloc: getItInstance(),
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance()));
  //registrando o MovieTabBloc
  getItInstance.registerFactory(() => MovieTabBloc(
        getPopular: getItInstance(),
        getPlayingNow: getItInstance(),
        getComingSoon: getItInstance(),
      ));
  //* LANGUAGE
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
      () => LanguageLocalDataSourceImpl());
  getItInstance.registerLazySingleton<AppRepository>(
      () => AppRepositoryImpl(languageLocalDataSource: getItInstance()));
  getItInstance.registerLazySingleton<GetPreferredLanguage>(
      () => GetPreferredLanguage(repository: getItInstance()));
  getItInstance.registerLazySingleton<UpdateLanguage>(
      () => UpdateLanguage(repository: getItInstance()));
  getItInstance.registerFactory<LanguageBloc>(() => LanguageBloc(
      getPreferredLanguage: getItInstance(), updateLanguage: getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(repository: getItInstance()));

  //register getCast usecase
  getItInstance.registerLazySingleton<GetCast>(
      () => GetCast(repository: getItInstance()));

  //register cast bloc
  getItInstance
      .registerFactory<CastBloc>(() => CastBloc(getCast: getItInstance()));
  //register videosBloc
  getItInstance.registerFactory<VideosBloc>(
      () => VideosBloc(getVideos: getItInstance()));
  //register usecase
  getItInstance.registerLazySingleton<GetVideos>(
      () => GetVideos(repository: getItInstance()));
  getItInstance.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(
      videosBloc: getItInstance(),
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      loadingBloc: getItInstance(),
      favoriteBloc: getItInstance()));

  //! SEARCH FEATURE

  //* PARA USECASES - registerLazySingleton
  //* PARA BLOCS
  getItInstance.registerLazySingleton<SearchMovies>(
      () => SearchMovies(repository: getItInstance()));
  getItInstance.registerFactory<SearchMoviesBloc>(() => SearchMoviesBloc(
      searchMovies: getItInstance(), loadingBloc: getItInstance()));

  //! LOCAL DATA USECASES
  getItInstance.registerLazySingleton<SaveMovie>(
      () => SaveMovie(repository: getItInstance()));
  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(repository: getItInstance()));
  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(repository: getItInstance()));
  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
      () => CheckIfFavoriteMovie(repository: getItInstance()));

  //* FAVORITE BLOC
  getItInstance.registerFactory<FavoriteBloc>(() => FavoriteBloc(
        saveMovie: getItInstance(),
        checkIfMovieIsFavorite: getItInstance(),
        deleteFavoriteMovie: getItInstance(),
        getFavoriteMovies: getItInstance(),
      ));

  //* LOGIN BLOC,REPO, DATASOURCES E USECASES
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(client: getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          authenticationLocalDataSource: getItInstance(),
          authenticationRemoteDataSource: getItInstance()));
  getItInstance.registerLazySingleton<LoginUser>(
      () => LoginUser(repository: getItInstance()));
  getItInstance.registerLazySingleton<LogoutUser>(
      () => LogoutUser(repository: getItInstance()));
  getItInstance.registerFactory<LoginBloc>(() => LoginBloc(
        loginUser: getItInstance(),
        logoutUser: getItInstance(),
      ));
}
