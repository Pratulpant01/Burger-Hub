// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class registerUserEvent extends AuthEvent {
  String emailId;
  String name;
  String password;
  String address;
  String phoneNumber;
  registerUserEvent({
    required this.emailId,
    required this.name,
    required this.password,
    required this.address,
    required this.phoneNumber,
  });
}

class loginUserEvent extends AuthEvent {
  String emailId;
  String password;
  loginUserEvent({
    required this.emailId,
    required this.password,
  });
}

class getUserDataEvent extends AuthEvent {}
