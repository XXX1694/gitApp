import 'package:equatable/equatable.dart';
import 'package:fit_app/features/login/data/repositories/user_auth_repository.dart';
import 'package:fit_app/services/network_info_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class LoginBloc extends Bloc<AuthEvent, AuthState> {
  final networkInfo = NetworkInfo();
  UserAuthRepository repo;

  LoginBloc({
    required this.repo,
    required AuthState userState,
  }) : super(UserOffline()) {
    on<LogIn>(
      (event, emit) async {
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          emit(ConnectionError());
        } else {
          try {
            bool response = repo.userLogIn(event.username, event.password);
            if (response) {
              emit(UserOnline());
            } else {
              emit(const UserLogError(message: 'Status code 400'));
            }
          } catch (e) {
            emit(UserLogError(message: e.toString()));
          }
        }
      },
    );
    on<LogOut>(
      (event, emit) {},
    );
  }
}
