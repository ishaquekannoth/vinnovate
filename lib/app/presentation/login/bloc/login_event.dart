part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class OnPasswordChange extends LoginEvent {
  final String password;
  const OnPasswordChange({
    required this.password,
  });
}

class OnEmailChange extends LoginEvent {
  final String email;
  const OnEmailChange({required this.email});
}



class OnLoginButtonPress extends LoginEvent {
  final String email;
  final String password;

  const OnLoginButtonPress({required this.email, required this.password});
}
