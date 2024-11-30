part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class PassObscureToggleEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({required this.email,required this.password});
  @override
  List<Object> get props => [];
}
