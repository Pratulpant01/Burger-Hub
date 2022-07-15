// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/constants/utils.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:burgerhub/view/admin/services/admin_services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  CategoryServices categoryServices;
  StreamSubscription? productStreamSubscription;

  ProductBloc(
    this.categoryServices,
  ) : super(ProductLoading()) {
    final List<ProductModel> products = [];
    productStreamSubscription?.cancel();

    productStreamSubscription =
        categoryServices.getProductsFromDatabase().listen((snapshot) {
      snapshot.docs.forEach((snap) {
        ProductModel product = ProductModel.fromJson(snap.data());
        products.add(product);
      });
      add(getProductsEvent());
    });

    on<getProductsEvent>((event, emit) {
      emit(
        ProductLoaded(products: products),
      );
    });
  }
  @override
  Future<void> close() {
    productStreamSubscription!.cancel();

    return super.close();
  }
}
