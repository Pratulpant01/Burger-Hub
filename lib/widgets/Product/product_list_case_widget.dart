import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/bottom_sheet_widget.dart';
import 'package:burgerhub/widgets/food%20widgets/food_type_widget.dart';
import 'package:burgerhub/widgets/Product/total_rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/product/product_screen.dart';
import '../input widgets/heading_widget.dart';

class ProductListCase extends StatelessWidget {
  ProductModel product;
  ProductListCase({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
          context: context,
          builder: (context) => bottomSheet_widget(
            price: product.price,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: screenSize.height * .13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1.2 / 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          style: productTitleStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        totalRatingWidget(
                          size: 10,
                        ),
                        Text(
                          product.description,
                          style: productDescriptionStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '₹${product.price}',
                          style: productPricingStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        foodTypeWidget(foodtype: product.type)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
