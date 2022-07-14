import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_quantity_event.dart';
part 'add_quantity_state.dart';

class AddQuantityBloc extends Bloc<AddQuantityEvent, AddQuantityState> {
  AddQuantityBloc() : super(AddQuantityInitial(1)) {
    on<IncrementQuantityEvent>((event, emit) {
      emit(AddQuantityLoaded(state.quantity++));
    });
    on<DecrementQuantityEvent>((event, emit) {
      if (state.quantity > 1) {
        emit(AddQuantityLoaded(state.quantity--));
      }
    });
  }
}
