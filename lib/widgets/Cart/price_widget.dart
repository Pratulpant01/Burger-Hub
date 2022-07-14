// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';

class priceWidget extends StatelessWidget {
  bool isButton;
  priceWidget({
    Key? key,
    required this.isButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isButton ? Colors.orange.withOpacity(0.09) : null,
          border: Border.all(
            color: isButton ? Colors.orange : bgSecondaryColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '₹5000',
            style: productPricingStyle.copyWith(
              color: primaryColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
