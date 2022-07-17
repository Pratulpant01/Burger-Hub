import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/bloc/Admin%20Bloc/admin_bloc.dart';
import 'package:burgerhub/models/cart_model.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/view/cart/services/cart_services.dart';
import 'package:equatable/equatable.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  CartServices cartServices;
  AddToCartBloc(this.cartServices) : super(AddToCartLoading()) {
    on<uploadProductToCartEvent>(
      (event, emit) async {
        int addonPrice = await cartServices.getAddonPrice(event.selectedAddons);
        int totalPrice = cartServices.getTotalPrice(
            event.product.price, event.quantity, addonPrice);

        await cartServices.addProductToCart(
          event.product,
          event.quantity,
          event.selectedAddons,
          totalPrice,
        );

        UploadProductsToCartLoaded();
      },
    );
  }
}
