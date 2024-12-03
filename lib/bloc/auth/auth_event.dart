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

final class ResetRequestEvent extends AuthEvent {
  final String email;
  const ResetRequestEvent({required this.email});
  @override
  List<Object> get props => [];
}
final class OtpVerifyEvent extends AuthEvent {
  final String otp;
  final String token;
  const OtpVerifyEvent({required this.token,required this.otp});
  @override
  List<Object> get props => [];
}
final class SetPasswordEvent extends AuthEvent {
  final String password;
  final String token;
  const SetPasswordEvent({required this.password,required this.token});
  @override
  List<Object> get props => [];
}
