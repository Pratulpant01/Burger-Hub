import 'package:burgerhub/bloc/Search%20Bloc/search_bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/AppBar/app_bar_widget.dart';
import 'package:burgerhub/widgets/AppBar/search_app_bar_widget.dart';
import 'package:burgerhub/widgets/Product/listile_widget.dart';
import 'package:burgerhub/widgets/Product/product_list_case_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/product_model.dart';
import '../widgets/Product/product_card_widget.dart';

class SearchScreen extends StatelessWidget {
  List<ProductModel> products = <ProductModel>[];
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgSecondaryColor,
        appBar: SearchAppBarWidget(),
        body: Container(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is SearchLoaded) {
                products.clear();

                state.snapshot.docs.forEach((snap) {
                  ProductModel searchedProduct =
                      ProductModel.fromJson(snap.data());
                  products.add(searchedProduct);
                });
                return ListView.builder(
                  itemCount: state.snapshot.docs.length,
                  itemBuilder: (context, index) {
                    return ProductListCase(
                        product: ProductModel.fromJson(
                            state.snapshot.docs[index].data()));
                  },
                );
              } else if (state is SearchScreenDefaultState) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemCount: state.snapshot.docs.length,
                  itemBuilder: (context, index) {
                    return productCard(
                      product: ProductModel.fromJson(
                          state.snapshot.docs[index].data()),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
