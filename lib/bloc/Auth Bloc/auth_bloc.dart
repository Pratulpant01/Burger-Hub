import 'dart:core';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/models/user_model.dart';
import 'package:burgerhub/view/auth/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthServices authServices;
  AuthBloc(this.authServices) : super(AuthBlocInitial()) {
    on<registerUserEvent>((event, emit) async {
      emit(AuthBlocLoading());
      String result = await authServices.registerUser(
        event.emailId,
        event.name,
        event.password,
        event.address,
        event.phoneNumber,
      );
      if (result == 'Registered Sucessfully') {
        print('Sucessfull');
      } else {
        print(result);
      }
      emit(AuthBlocLoaded());
    });

    on<loginUserEvent>((event, emit) async {
      emit(AuthBlocLoading());
      String result = await authServices.signInUser(
        event.emailId,
        event.password,
      );
      emit(AuthBlocLoaded());
    });

    on<getUserDataEvent>((event, emit) async {
      emit(AuthBlocLoading());
      UserModel userData = await authServices.getUserData();
      emit(AuthBlocLoaded(userData: userData));
      print(userData);
    });
  }
}
