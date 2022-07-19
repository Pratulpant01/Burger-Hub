import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/view/product/services/product_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ProductServices productServices;
  late StreamSubscription searchProductSubscription;

  SearchBloc(this.productServices) : super(SearchInitial()) {
    on<SearchProductEvent>((event, emit) async {
      emit(SearchLoading());
      await emit.forEach(productServices.searchItem(event.searchQuery),
          onData: (QuerySnapshot<Map<String, dynamic>> snapshot) {
        return (SearchLoaded(snapshot: snapshot));
      });
    });
  }
}
