// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  ProductLoaded({
    this.products = const <ProductModel>[],
  });
  @override
  List<Object?> get props => [products];
}

class SelectedProductLoad extends ProductState {
  ProductModel? selectedProduct;
  SelectedProductLoad(this.selectedProduct);

  @override
  List<Object?> get props => [selectedProduct];
}
