import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/usecases/login_request_params.dart';
import 'package:clean_movies/domain/usecases/login_user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;
  LoginBloc({required this.loginUser}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginInitiateEvent) {
        final Either<AppError, bool> eitherResponse = await loginUser(
            LoginRequestParams(
                userName: event.username, password: event.password));

        eitherResponse.fold((error) {
          var message = getErrorMessage(error.errorType);
          emit(LoginError(message: message));
        }, (success) => emit(LoginSuccess()));
      }
    });
  }

  String getErrorMessage(AppErrorType errorType) {}
}
