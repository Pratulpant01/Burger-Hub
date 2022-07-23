// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  String selectedAddress;

  CheckoutState({
    this.selectedAddress = '',
  });

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  CheckoutLoaded({required super.selectedAddress});
}
