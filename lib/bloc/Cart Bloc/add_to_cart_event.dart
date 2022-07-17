// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_cart_bloc.dart';

abstract class AddToCartEvent extends Equatable {
  ProductModel product;
  AddToCartEvent({required this.product});

  @override
  List<Object> get props => [];
}

class uploadProductToCartEvent extends AddToCartEvent {
  List selectedAddons;
  int quantity;
  uploadProductToCartEvent({
    required this.selectedAddons,
    required this.quantity,
    required super.product,
  });
}

class updateProductQuantity extends AddToCartEvent {
  List selectedAddons;
  int quantity;
  updateProductQuantity({
    required super.product,
    required this.selectedAddons,
    required this.quantity,
  });
}
