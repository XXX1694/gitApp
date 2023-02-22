part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LogIn extends LoginEvent {
  final String username;
  final String password;
  const LogIn({required this.username, required this.password});
}

class LogOut extends LoginEvent {}
