import 'package:equatable/equatable.dart';

enum AppErrorType { api, network, database, unauthorized, sessionDenied }

class AppError extends Equatable {
  final AppErrorType errorType;
  const AppError(this.errorType);

  @override
  List<Object?> get props => [errorType];
}
