import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class TotalSavingWidget extends StatelessWidget {
  const TotalSavingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: bluePrimaryColor.withOpacity(0.1),
          border: Border.all(color: bluePrimaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your total savings',
            style: productDescriptionStyle.copyWith(
              fontSize: 17,
              color: bluePrimaryColor,
              fontWeight: FontWeight.bold,
              wordSpacing: 5,
            ),
          ),
          Text(
            '₹5000',
            style: productDescriptionStyle.copyWith(
              color: bluePrimaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
