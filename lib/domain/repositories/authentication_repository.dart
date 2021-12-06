import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body);
  Future<Either<AppError, void>> logoutUser();
}
