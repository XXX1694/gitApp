import 'package:equatable/equatable.dart';
import 'package:fit_app/features/registration/data/repositories/registration_repository.dart';
import 'package:fit_app/services/network_info_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final networkInfo = NetworkInfo();
  RegistrationRepository repo;

  RegistrationBloc({
    required this.repo,
    required RegistrationState registrationState,
  }) : super(RegistrationInitial()) {
    on<CreateUser>(
      (event, emit) async {
        emit(UserCreating());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('User create: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            await repo.createUser(event.username, event.password);
            // var success = await repo.gerUserID();
            if (kDebugMode) {
              print('User create: Success');
            }
            emit(UserCreated());
          } catch (e) {
            if (kDebugMode) {
              print('User create: Error');
            }
            emit(UserCreateError(message: e.toString()));
          }
        }
      },
    );
    on<CreateProfile>(
      (event, emit) async {
        emit(ProfileCreating());
        final isConnected = await networkInfo.isConnected();
        if (!isConnected) {
          if (kDebugMode) {
            print('User create: No internet connection');
          }
          emit(ConnectionError());
        } else {
          try {
            await repo.editProfile(
              event.firstName,
              event.lastName,
              event.birthDate,
              event.sex,
              event.phoneNumber,
              event.email,
            );
            if (kDebugMode) {
              print('Profile create: Success');
            }
            await repo.clientCreate();
            if (kDebugMode) {
              print('Client create: Success');
            }
            emit(ProfileCreated());
          } catch (e) {
            if (kDebugMode) {
              print('Profile create: Error');
            }
            emit(ProfileCreateError(message: e.toString()));
          }
        }
      },
    );
  }
}
