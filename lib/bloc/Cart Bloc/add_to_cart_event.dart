part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class uploadProductToCartEvent extends AddToCartEvent {}

class getQuantity extends AddToCartEvent {}
