import 'package:equatable/equatable.dart';
import 'package:fit_app/features/login/data/repositories/user_auth_repository.dart';
import 'package:fit_app/services/network_info_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final networkInfo = NetworkInfo();
  UserAuthRepository repo;

  AuthBloc({
    required this.repo,
    required AuthState userState,
  }) : super(UserOffline()) {
    on<LogIn>(
      (event, emit) async {
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          print('User Auth: No internet connection');
          emit(ConnectionError());
        } else {
          try {
            var response = repo.userLogIn(event.username, event.password);
            print('User Auth: Success');
            emit(UserOnline());
          } catch (e) {
            print('User Auth: Error');
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
