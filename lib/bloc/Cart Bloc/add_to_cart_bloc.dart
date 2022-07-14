import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/bloc/Admin%20Bloc/admin_bloc.dart';
import 'package:burgerhub/models/cart_model.dart';
import 'package:equatable/equatable.dart';

part 'add_to_cart_event.dart';
part 'add_to_cart_state.dart';

class AddToCartBloc extends Bloc<AddToCartEvent, AddToCartState> {
  AddToCartBloc addToCartBloc;
  StreamSubscription? quantitySubscription;
  AddToCartBloc(this.addToCartBloc) : super(AddToCartInitial()) {
    quantitySubscription = addToCartBloc.stream.listen((state) {
      if (state is AddQuantityLoaded) {
        print(state.);
      }
    });

    on<uploadProductToCartEvent>((event, emit) {});
  }
}
