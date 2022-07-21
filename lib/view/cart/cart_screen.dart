// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/Cart/cart_products_widget.dart';

import '../../widgets/Cart/addons_widget.dart';
import '../../widgets/Cart/cart_bottom_sheet.dart';
import '../../widgets/Cart/price_taxes_widget.dart';
import '../../widgets/Cart/price_widget.dart';
import '../../widgets/Cart/total_savings_widget.dart';
import '../../widgets/button/delete_button.dart';
import '../../widgets/button/primary_button.dart';

class CartScreen extends StatelessWidget {
  ProductModel? product;
  bool addonList = false;
  CartScreen({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: cartBottomSheet(),
      appBar: SimpleAppBarWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TotalSavingWidget(),
            CartProductsWidget(),
          ],
        ),
      ),
    );
  }
}

class PriceOverviewWidget extends StatelessWidget {
  int totalPrice;
  PriceOverviewWidget({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: screenSize.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white30,
      ),
      child: Column(
        children: [
          TaxesPriceWidget(
            title: 'Item Total',
            price: '₹${totalPrice}',
            oldPrice: '',
            isOffer: false,
          ),
          TaxesPriceWidget(
            title: 'Taxes & Restaurant charges',
            price: '₹66',
            oldPrice: '₹122',
            isOffer: true,
          ),
          TaxesPriceWidget(
            title: 'Delivery Charges',
            price: '₹0',
            oldPrice: '₹86',
            isOffer: true,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(
                    'Grand Total',
                    style: labelTitleStyle.copyWith(fontSize: 15),
                  ),
                ),
                FittedBox(
                  child: Text(
                    '₹${totalPrice}',
                    style: productPricingStyle.copyWith(fontSize: 13),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
