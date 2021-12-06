import 'package:clean_movies/domain/repositories/app_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_movies/domain/entities/app_error.dart';

import '../usecase.dart';

class UpdateLanguage extends UseCase<void, String> {
  final AppRepository repository;

  UpdateLanguage({required this.repository});
  @override
  Future<Either<AppError, void>> call(String languageCode) async {
    return await repository.updateLanguage(languageCode);
  }
}
