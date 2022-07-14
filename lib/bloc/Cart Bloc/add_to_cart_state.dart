part of 'add_to_cart_bloc.dart';

abstract class AddToCartState extends Equatable {
  const AddToCartState();

  @override
  List<Object> get props => [];
}

class AddToCartInitial extends AddToCartState {}

class UploadProductsToCartLoading extends AddToCartState {}

class UploadProductsToCartLoaded extends AddToCartState {}
