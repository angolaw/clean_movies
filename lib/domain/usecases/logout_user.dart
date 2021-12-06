import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';
import 'no_params.dart';

class LogoutUser extends UseCase<void, NoParams> {
  final AuthenticationRepository repository;

  LogoutUser({required this.repository});

  @override
  Future<Either<AppError, void>> call(NoParams params) async {
    return await repository.logoutUser();
  }
}
