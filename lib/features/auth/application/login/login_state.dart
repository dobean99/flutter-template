part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => const [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final String token;

  const LoginSuccess(this.token);

  @override
  List<Object?> get props => [token];
}

class LoginFailure extends LoginState {
  final LoginNetworkError error;

  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
