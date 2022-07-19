import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class TaxesPriceWidget extends StatelessWidget {
  final String title;
  final String price;
  bool isOffer;
  final String oldPrice;
  TaxesPriceWidget({
    Key? key,
    required this.title,
    required this.price,
    this.isOffer = false,
    required this.oldPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              style: productDescriptionStyle.copyWith(
                letterSpacing: 1,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isOffer
                    ? FittedBox(
                        child: Text(
                          oldPrice,
                          style: optionStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: screenSize.width * .02,
                ),
                FittedBox(
                  child: Text(
                    price,
                    style: optionStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
