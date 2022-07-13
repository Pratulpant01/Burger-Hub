// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:burgerhub/widgets/product_card_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';

class SeeMoreProductScreen extends StatelessWidget {
  String categoryName;
  bool showProducts;
  SeeMoreProductScreen({
    Key? key,
    required this.categoryName,
    this.showProducts = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: showProducts
                  ? CategoryServices().getProductsFromDatabase()
                  : CategoryServices().getProductsByCategories(categoryName),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }

                return Expanded(
                  child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 2.5,
                      ),
                      itemBuilder: (context, index) {
                        return productCard(
                            product: ProductModel.fromJson(
                                snapshot.data.docs[index].data()));
                      }),
                );
              }),
        ],
      ),
    );
  }
}
