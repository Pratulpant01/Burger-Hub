// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:burgerhub/view/admin/services/admin_services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  AdminServices adminServices;
  ProductBloc(
    this.adminServices,
  ) : super(ProductInitial()) {
    on<uploadProductEvent>((event, emit) async {
      emit(ProductUploading());
      String result = await adminServices.uploadProductToDatabase(
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
  }
}
