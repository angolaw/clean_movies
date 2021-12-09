import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class UpdatePreferredTheme extends UseCase<void, String> {
  final AppRepository repository;

  UpdatePreferredTheme({required this.repository});

  @override
  Future<Either<AppError, void>> call(String params) async {
    return await repository.updatePreferredTheme(params);
  }
}
