import 'package:equatable/equatable.dart';
import 'package:fit_app/features/login/data/repositories/user_auth_repository.dart';
import 'package:fit_app/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
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
          if (kDebugMode) {
            print('User Auth: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            await repo.userLogIn(event.username, event.password);
            await repo.gerUserID();
            if (kDebugMode) {
              print('User Auth: Success');
            }
            emit(UserOnline());
          } catch (e) {
            if (kDebugMode) {
              print('User Auth: Error');
            }
            emit(UserLogError(message: e.toString()));
          }
        }
      },
    );

    on<GetUserStatus>(
      (event, emit) async {
        final isOnline = await repo.isUserOnline();
        if (isOnline) {
          emit(UserOnline());
        } else {
          emit(UserOffline());
        }
      },
    );

    on<LogOut>(
      (event, emit) {},
    );
  }
}
