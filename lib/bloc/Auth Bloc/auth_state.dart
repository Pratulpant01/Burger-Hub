// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  UserModel? userData;
}

class AuthBlocInitial extends AuthState {}

class AuthBlocLoading extends AuthState {}

class AuthBlocLoaded extends AuthState {
  UserModel? userData;
  AuthBlocLoaded({
    this.userData,
  });
}
