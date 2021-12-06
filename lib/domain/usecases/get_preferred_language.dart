import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/app_repository.dart';
import 'package:clean_movies/domain/usecase.dart';
import 'package:dartz/dartz.dart';

import 'no_params.dart';

class GetPreferredLanguage extends UseCase<String, NoParams> {
  final AppRepository repository;

  GetPreferredLanguage({required this.repository});

  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await repository.getPreferredLanguage();
  }
}
