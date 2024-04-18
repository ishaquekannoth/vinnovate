part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState({required this.isEmailValid, required this.isPasswordValid});
  final bool isEmailValid;
  final bool isPasswordValid;
  @override
  List<Object> get props => [isEmailValid, isPasswordValid];
}

final class LoginValidated extends LoginState {
  const LoginValidated(
      {required super.isEmailValid, required super.isPasswordValid});
}

class LoginLoading extends LoginState {
  const LoginLoading(
      {required super.isEmailValid, required super.isPasswordValid});
}

class LoginSuccess extends LoginState {
  final String message;
  const LoginSuccess(
      {required this.message,
      required super.isEmailValid,
      required super.isPasswordValid});
}

class LoginFailure extends LoginState {
   final String message;
  const LoginFailure(

      {required this.message, required super.isEmailValid, required super.isPasswordValid});
}
