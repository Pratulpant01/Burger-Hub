// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_quantity_bloc.dart';

abstract class AddQuantityState extends Equatable {
  int quantity;
  AddQuantityState({required this.quantity});

  @override
  List<Object> get props => [quantity];
}

class AddQuantityInitial extends AddQuantityState {
  AddQuantityInitial() : super(quantity: 1);
}

class AddQuantityLoaded extends AddQuantityState {
  AddQuantityLoaded({required super.quantity});
}
