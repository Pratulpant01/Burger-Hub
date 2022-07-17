// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_to_cart_bloc.dart';

abstract class AddToCartState extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToCartLoading extends AddToCartState {}

class UploadProductsToCartLoaded extends AddToCartState {}
