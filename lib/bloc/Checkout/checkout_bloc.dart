import 'package:bloc/bloc.dart';
import 'package:burgerhub/view/checkout/services/checkout_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutServices checkoutServices;
  CheckoutBloc(this.checkoutServices) : super(CheckoutInitial()) {
    on<getSelectedAddressEvent>((event, emit) async {
      emit(CheckoutLoading());
      await Future.delayed(Duration(seconds: 5));
      print(state);

      String shippingAddress = await checkoutServices.checkAddressType(
        event.name,
        event.addressFormKey,
        event.address,
        event.addressType,
        event.flatNumber,
        event.phoneNumber,
        event.defaultAddress,
      );

      emit(CheckoutLoaded(selectedAddress: shippingAddress));

      // String selectedAddress = '';
      // bool isNewAddress = event.address.isNotEmpty &&
      //     event.name.isNotEmpty &&
      //     event.phoneNumber.isNotEmpty;
      // if (isNewAddress) {
      //   if (event.addressFormKey.currentState!.validate()) {
      //     selectedAddress =
      //         '${event.name}, ${event.address},  ${event.flatNumber},  ${event.phoneNumber}- ${event.addressType} ';
      //   } else {
      //     print('Please fill all the required fields');
      //   }
      // } else if (event.defaultAddress.isNotEmpty) {
      //   selectedAddress = event.defaultAddress;
      // } else {
      //   throw Exception('Error');
      // }
    });
  }
}
