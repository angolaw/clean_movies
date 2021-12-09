import 'package:clean_movies/data/datasources/language_local_data_source.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';

class AppRepositoryImpl extends AppRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImpl({required this.languageLocalDataSource});
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
    try{
      final response = await 
    }on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> updatePreferredTheme(String theme) {
    // TODO: implement updatePreferredTheme
    throw UnimplementedError();
  }
}
