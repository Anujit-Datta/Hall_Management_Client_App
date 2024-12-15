part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  final bool isObscure;
  final String? errorMessage;
  const AuthInitial({this.isObscure = true,this.errorMessage});
  @override
  List<Object> get props => [isObscure];
}

final class LoggedInState extends AuthState {
  @override
  List<Object> get props => [];
}