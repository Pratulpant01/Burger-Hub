part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {}

class CategoryProductsLoading extends CategoryState {}

class CategoryProductsLoaded extends CategoryState {}
