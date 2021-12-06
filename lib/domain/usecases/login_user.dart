import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/authentication_repository.dart';
import 'package:clean_movies/domain/usecase.dart';
import 'package:dartz/dartz.dart';

import 'login_request_params.dart';

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final AuthenticationRepository repository;

  LoginUser({required this.repository});

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async {
    return await repository.loginUser(params.toJson());
  }
}
