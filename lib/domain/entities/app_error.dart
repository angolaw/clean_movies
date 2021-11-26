import 'package:equatable/equatable.dart';

enum AppErrorType { api, network }

class AppError extends Equatable {
  final AppErrorType errorType;
  const AppError(this.errorType);

  @override
  // TODO: implement props
  List<Object?> get props => [errorType];
}
