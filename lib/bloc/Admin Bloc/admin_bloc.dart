import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../constants/utils.dart';
import '../../view/admin/services/admin_services.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminServices adminServices;

  AdminBloc(this.adminServices) : super(AdminInitial()) {
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
        emit(AdminInitial());
      }
    });
  }
}
