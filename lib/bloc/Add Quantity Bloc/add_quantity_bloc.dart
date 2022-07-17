import 'package:bloc/bloc.dart';
import 'package:burgerhub/view/cart/services/cart_services.dart';
import 'package:equatable/equatable.dart';

part 'add_quantity_event.dart';
part 'add_quantity_state.dart';

class AddQuantityBloc extends Bloc<AddQuantityEvent, AddQuantityState> {
  CartServices cartServices;
  AddQuantityBloc(this.cartServices) : super(AddQuantityInitial()) {
    on<AddQuantityEvent>((event, emit) async {
      bool isProductinCart =
          await cartServices.checkProductinCart(event.productId);

      if (event is IncrementQuantityEvent) {
        if (isProductinCart) {
          if (state.quantity < 10) {
            emit(AddQuantityLoaded(quantity: state.quantity + 1));
            await cartServices.updateQuantity(state.quantity, event.productId);
          }
        } else if (!isProductinCart && state.quantity < 10) {
          emit(AddQuantityLoaded(quantity: state.quantity + 1));
        }
      }
      if (event is DecrementQuantityEvent) {
        if (isProductinCart) {
          if (state.quantity > 1) {
            emit(AddQuantityLoaded(quantity: state.quantity - 1));
            await cartServices.updateQuantity(state.quantity, event.productId);
          }
        } else if (!isProductinCart && state.quantity > 1) {
          emit(AddQuantityLoaded(quantity: state.quantity - 1));
        }
      }
    });
  }
}
