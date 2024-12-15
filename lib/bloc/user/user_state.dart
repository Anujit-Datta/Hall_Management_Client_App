part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoaded extends UserState {
  final User user;
  UserLoaded({required this.user});
}

final class UserError extends UserState {
  final String error;
  UserError({required this.error});
}
