import 'dart:io';

import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/datasources/authentication_local_data_source.dart';
import 'package:clean_movies/data/datasources/authentication_remote_data_source.dart';
import 'package:clean_movies/data/models/request_model_token.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
    required this.authenticationLocalDataSource,
  });
  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> body) async {
    final requestTokenEitherResponse = await _getRequestToken();
    final token1 = requestTokenEitherResponse
            .getOrElse(() => RequestTokenModel())
            .requestToken ??
        '';

    try {
      body.putIfAbsent('request_token', () => token1);
      final validateWithLoginToken =
          await authenticationRemoteDataSource.validateWithLogin(body);
      final sessionId = await authenticationRemoteDataSource
          .createSession(validateWithLoginToken.toJson());
      if (sessionId != null) {
        await authenticationLocalDataSource.saveSessionId(sessionId);
        return const Right(true);
      }
      return const Left(AppError(AppErrorType.sessionDenied));
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return const Left(AppError(AppErrorType.unauthorized));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  Future<Either<AppError, RequestTokenModel>> _getRequestToken() async {
    try {
      final requestTokenModel =
          await authenticationRemoteDataSource.getRequestToken();
      return Right(requestTokenModel);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }
}
