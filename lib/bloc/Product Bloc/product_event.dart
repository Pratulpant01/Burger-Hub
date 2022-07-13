// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class getProductsEvent extends ProductEvent {}
