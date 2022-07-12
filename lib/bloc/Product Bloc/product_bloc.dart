// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/constants/utils.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:burgerhub/view/admin/services/admin_services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  CategoryServices categoryServices;
  StreamSubscription? productStreamSubscription;

  AdminServices? adminServices;
  ProductBloc(
    this.categoryServices,
  ) : super(ProductInitial()) {
    on<uploadProductEvent>((event, emit) async {
      emit(ProductUploading());
      String result = await adminServices!.uploadProductToDatabase(
        productName: event.productName,
        description: event.description,
        price: event.price,
        time: event.time,
        category: event.category,
        type: event.type,
        image: event.image,
      );
      if (result == 'Product Uploaded Sucessfully') {
        Utils().showSnackBar(
          context: event.context!,
          message: result,
        );
        emit(ProductUploaded());
      } else {
        Utils().showSnackBar(
          context: event.context!,
          message: result,
        );
        emit(ProductInitial());
      }
    });

    on<getProductsEvent>((event, emit) async {
      emit(ProductLoading());
      List<ProductModel> products = [];

      productStreamSubscription =
          await categoryServices.getProductsFromDatabase().listen((snapshot) {
        snapshot.docs.forEach((snap) {
          ProductModel product = ProductModel.fromJson(snap.data());
          products.add(product);
        });
      });
      emit(
        ProductLoaded(products: products),
      );
    });
  }
  @override
  Future<void> close() {
    productStreamSubscription!.cancel();

    // TODO: implement close
    return super.close();
  }
}
