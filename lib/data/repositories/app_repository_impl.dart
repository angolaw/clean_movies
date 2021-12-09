import 'package:clean_movies/data/datasources/language_local_data_source.dart';
import 'package:clean_movies/data/datasources/theme_local_data_source.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;
  final ThemeLocalDataSource themeLocalDataSource;

  AppRepositoryImpl(
      {required this.languageLocalDataSource,
      required this.themeLocalDataSource});
  @override
  Future<Either<AppError, String>> getPreferredLanguage() async {
    try {
      final language = await languageLocalDataSource.getPreferredLanguage();
      return Right(language);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String language) async {
    try {
      final response = await languageLocalDataSource.updateLanguage(language);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, String>> getPreferredTheme() async {
    try {
      final response = await themeLocalDataSource.getPreferredTheme();
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updatePreferredTheme(String theme) async {
    try {
      final response = await themeLocalDataSource.updateTheme(theme);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }
}
