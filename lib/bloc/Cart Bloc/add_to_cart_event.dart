// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent extends Equatable {
  const AddToCartEvent();

  @override
  List<Object> get props => [];
}

class uploadProductToCartEvent extends AddToCartEvent {
  ProductModel product;
  List selectedAddons;
  int quantity;
  uploadProductToCartEvent({
    required this.product,
    required this.selectedAddons,
    required this.quantity,
  });
}
