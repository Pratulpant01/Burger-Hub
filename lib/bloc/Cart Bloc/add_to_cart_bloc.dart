import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/bloc/Admin%20Bloc/admin_bloc.dart';
import 'package:burgerhub/models/cart_model.dart';
import 'package:burgerhub/view/cart/services/cart_services.dart';
import 'package:equatable/equatable.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  CartServices cartServices;
  AddQuantityBloc addQuantityBloc;
  StreamSubscription? quantitySubscription;
  AddToCartBloc(this.addQuantityBloc, this.cartServices)
      : super(AddToCartInitial()) {
    on<uploadProductToCartEvent>((event, emit) async {});
  }
}
