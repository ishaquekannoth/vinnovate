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
