// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/app_bar_widget.dart';
import 'package:burgerhub/widgets/total_rating_widget.dart';

import '../widgets/button/add_quantity_widget.dart';
import '../widgets/button/round_button.dart';

class ProductScreen extends StatefulWidget {
  ProductModel product;
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
    return Scaffold(
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
              child: Hero(
                tag: 1,
                child: Image.network(
                  widget.product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              margin: EdgeInsets.symmetric(
                vertical: screenSize.height / 2.3,
              ),
              height: screenSize.height / 1,
              decoration: BoxDecoration(
                color: bgSecondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      widget.product.productName,
                      style: secondaryTitleStyle.copyWith(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Divider(),

                  // SizedBox(
                  //   height: screenSize.height * .05,
                  // ),
                  Container(
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
                        addQuantityWidget()
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Center(
                      child: Text(
                        widget.product.description,
                        style: productDescriptionStyle.copyWith(
                          fontSize: 18,
                        ),
                        maxLines: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
