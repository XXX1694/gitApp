part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class UserOffline extends LoginState {}

class UserLoading extends LoginState {}

class UserOnline extends LoginState {}

class ConnectionError extends LoginState {}

class UserLogError extends LoginState {
  final String message;
  const UserLogError({required this.message});
}
