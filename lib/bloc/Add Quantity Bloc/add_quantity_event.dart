part of 'add_quantity_bloc.dart';

abstract class AddQuantityEvent extends Equatable {
  const AddQuantityEvent();

  @override
  List<Object> get props => [];
}

class IncrementQuantityEvent extends AddQuantityEvent {}

class DecrementQuantityEvent extends AddQuantityEvent {}
