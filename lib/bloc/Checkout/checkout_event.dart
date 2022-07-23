// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class getSelectedAddressEvent extends CheckoutEvent {
  String name;
  GlobalKey<FormState> addressFormKey;
  String address;
  String addressType;
  String flatNumber;
  String phoneNumber;
  String defaultAddress;
  getSelectedAddressEvent({
    required this.name,
    required this.addressFormKey,
    required this.address,
    required this.addressType,
    required this.flatNumber,
    required this.phoneNumber,
    required this.defaultAddress,
  });
}
