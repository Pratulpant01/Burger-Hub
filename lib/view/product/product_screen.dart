// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/bloc/Cart%20Bloc/add_to_cart_bloc.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:burgerhub/view/product/services/product_services.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/AppBar/app_bar_widget.dart';
import 'package:burgerhub/widgets/Product/total_rating_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/Product/time_widget.dart';
import '../../widgets/bottom_sheet_widget.dart';
import '../../widgets/button/add_quantity_widget.dart';
import '../../widgets/button/primary_button.dart';
import '../../widgets/button/round_button.dart';
import '../../widgets/food widgets/food_type_widget.dart';

class ProductScreen extends StatefulWidget {
  List selectedAddons = [];

  List addonList = [];
  List<bool>? isChecked;

  ProductModel product;
  ProductScreen({
    Key? key,
    required this.product,
  }) : this.isChecked = List<bool>.filled(5, false);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    getAddons();

    super.initState();
  }

  getAddons() async {
    List addons = await ProductServices().getAddons();
    setState(() {
      widget.addonList = addons;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.product.price;
    return Scaffold(
      bottomSheet: bottomSheet_widget(
        selectedAddon: widget.selectedAddons,
        product: widget.product,
        price: totalPrice,
      ),
      appBar: AppBarWidget(
        hasBackButton: true,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: screenSize.height / 2.4,
            width: screenSize.width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              child: Image.network(
                widget.product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height / 2.3,
              ),
              decoration: BoxDecoration(
                color: bgSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Center(
                          child: Text(
                            widget.product.productName,
                            style: secondaryTitleStyle.copyWith(
                              fontSize: 25,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      foodTypeWidget(
                        foodtype: widget.product.type,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * .02,
                  ),
                  TimeRatingWidget(widget: widget),
                  Flexible(
                    flex: 0,
                    child: Center(
                      child: Text(
                        widget.product.description,
                        style: productDescriptionStyle.copyWith(
                          fontSize: 15,
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .05,
                  ),

                  // To add list of addons in the product screen.

                  headingWidget(
                    title: 'Add Addons',
                    isMore: false,
                  ),
                  Container(
                    width: screenSize.width,
                    child: ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: widget.addonList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: CheckboxListTile(
                              subtitle: Text(
                                '₹${widget.addonList[index].price}',
                                style:
                                    labelTitleStyle.copyWith(color: Colors.red),
                              ),
                              title: Text(widget.addonList[index].addonName),
                              value: widget.isChecked![index],
                              onChanged: (value) {
                                setState(() {
                                  widget.isChecked![index] = value!;
                                  if (widget.isChecked![index] == true) {
                                    widget.selectedAddons
                                        .add(widget.addonList[index].addonName);
                                  }
                                  if (widget.isChecked![index] == false) {
                                    widget.selectedAddons.remove(
                                        widget.addonList[index].addonName);
                                  }
                                  print(widget.selectedAddons);
                                });
                              },
                            ),
                          );
                        }),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeRatingWidget extends StatelessWidget {
  const TimeRatingWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          totalRatingWidget(
            size: 15,
          ),
          timeWidget(widget: widget),
        ],
      ),
    );
  }
}
