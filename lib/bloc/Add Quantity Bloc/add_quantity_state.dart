// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_quantity_bloc.dart';

abstract class AddQuantityState extends Equatable {
  int quantity;
  AddQuantityState(
    this.quantity,
  );

  @override
  List<Object> get props => [quantity];
}

class AddQuantityInitial extends AddQuantityState {
  AddQuantityInitial(super.quantity);
}

class AddQuantityLoaded extends AddQuantityState {
  AddQuantityLoaded(super.quantity);
}
