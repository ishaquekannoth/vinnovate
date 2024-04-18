import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinnovate/app/repos/login_repo/login_repo.dart';
import 'package:vinnovate/app/utilities/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(
            const LoginValidated(isEmailValid: false, isPasswordValid: false)) {
    on<OnEmailChange>((event, emit) {
      emit(LoginValidated(
          isEmailValid: event.email.isValidEmail,
          isPasswordValid: state.isPasswordValid));
    });
    on<OnPasswordChange>((event, emit) {
      emit(LoginValidated(
          isEmailValid: state.isEmailValid,
          isPasswordValid: event.password.length > 7));
    });

    on<OnLoginButtonPress>((event, emit) async {
      emit(LoginLoading(
          isEmailValid: state.isEmailValid,
          isPasswordValid: state.isPasswordValid));
      final result = await LoginRepo()
          .loginUser(emailAddress: event.email, password: event.password);
      if (result.successResponse is UserCredential) {
        emit(const LoginSuccess(
            isEmailValid: true,
            isPasswordValid: true,
            message: "Success fully loggged in"));
      } else {
        emit(LoginFailure(
            isEmailValid: true,
            isPasswordValid: true,
            message: result.toString()));
      }
    });
  }
}
