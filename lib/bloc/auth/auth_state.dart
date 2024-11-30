part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  bool isObscure;
  AuthInitial({this.isObscure = true});
  @override
  List<Object> get props => [isObscure,];
}

final class LoggedInState extends AuthState {
  @override
  List<Object> get props => [];
}

final class LoginErrorState extends AuthState {
  final String errorMessage;
  const LoginErrorState(this.errorMessage);
  @override
  List<Object> get props => [];
}
