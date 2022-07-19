import 'package:bloc/bloc.dart';
import 'package:burgerhub/models/cart_model.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/view/cart/services/cart_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'add_quantity_event.dart';
part 'add_quantity_state.dart';

class AddQuantityBloc extends Bloc<AddQuantityEvent, AddQuantityState> {
  CartServices cartServices;
  AddQuantityBloc(this.cartServices) : super(AddQuantityInitial()) {
    on<AddQuantityEvent>((event, emit) async {
      bool isProductinCart =
          await cartServices.checkProductinCart(event.product.productId);

      if (event is IncrementQuantityEvent) {
        if (isProductinCart) {
          if (event.quantity! < 10) {
            emit(AddQuantityLoaded(
              quantity: event.quantity!,
            ));

            await cartServices.updateCartProduct(
                event.quantity!, event.product);
          }
        } else if (!isProductinCart && event.quantity! < 10) {
          emit(AddQuantityLoaded(quantity: event.quantity!));
        }
      }
      if (event is DecrementQuantityEvent) {
        if (isProductinCart) {
          if (event.quantity! >= 1) {
            emit(AddQuantityLoaded(quantity: event.quantity! - 1));
            await cartServices.updateCartProduct(
                event.quantity!, event.product);
          }
        } else if (!isProductinCart && state.quantity >= 1) {
          emit(AddQuantityLoaded(quantity: event.quantity! - 1));
        }
      }
    });
  }
}
