import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class AppRepository {
  Future<Either<AppError, void>> updateLanguage(String language);
  Future<Either<AppError, String>> getPreferredLanguage();
  Future<Either<AppError, String>> getPreferredTheme();
  Future<Either<AppError, void>> updatePreferredTheme(String theme);
}
