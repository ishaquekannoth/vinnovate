import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  }
}
