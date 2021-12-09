import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/app_repository.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class GetPreferredTheme extends UseCase<String, NoParams> {
  final AppRepository repository;

  GetPreferredTheme({required this.repository});
  @override
  Future<Either<AppError, String>> call(NoParams params) async {
    return await repository.getPreferredTheme();
  }
}
