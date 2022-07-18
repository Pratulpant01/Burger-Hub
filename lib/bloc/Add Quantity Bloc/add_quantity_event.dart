// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_quantity_bloc.dart';

abstract class AddQuantityEvent extends Equatable {
  String productId;
  AddQuantityEvent(this.productId);

  @override
  List<Object> get props => [];
}

class IncrementQuantityEvent extends AddQuantityEvent {
  int? quantity;
  IncrementQuantityEvent(
    this.quantity,
    super.productId,
  );
}

class DecrementQuantityEvent extends AddQuantityEvent {
  int? quantity;
  DecrementQuantityEvent(
    this.quantity,
    super.productId,
  );
}
