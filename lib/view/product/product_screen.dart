// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/services/category_services.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/AppBar/app_bar_widget.dart';
import 'package:burgerhub/widgets/Product/total_rating_widget.dart';

import '../../widgets/Product/time_widget.dart';
import '../../widgets/bottom_sheet_widget.dart';
import '../../widgets/button/add_quantity_widget.dart';
import '../../widgets/button/primary_button.dart';
import '../../widgets/button/round_button.dart';
import '../../widgets/food widgets/food_type_widget.dart';

class ProductScreen extends StatefulWidget {
  ProductModel product;
  List<bool> isChecked = List<bool>.filled(addonList.length, false);
  ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    int totalPrice = widget.product.price;

    return Scaffold(
      bottomSheet: bottomSheet_widget(
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
                        itemCount: addonList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: CheckboxListTile(
                              subtitle: Text(
                                '₹${addonList[index].price}',
                                style:
                                    labelTitleStyle.copyWith(color: Colors.red),
                              ),
                              title: Text(addonList[index].addonName),
                              value: widget.isChecked[index],
                              onChanged: (value) {
                                setState(() {
                                  widget.isChecked[index] = value!;
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
