part of 'add_quantity_bloc.dart';

abstract class AddQuantityEvent extends Equatable {
  String productId;
  AddQuantityEvent(this.productId);

  @override
  List<Object> get props => [];
}

class IncrementQuantityEvent extends AddQuantityEvent {
  IncrementQuantityEvent(super.productId);
}

class DecrementQuantityEvent extends AddQuantityEvent {
  DecrementQuantityEvent(super.productId);
}
