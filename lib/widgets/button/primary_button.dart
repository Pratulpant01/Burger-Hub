import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class primaryButton extends StatelessWidget {
  const primaryButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        height: screenSize.width * .14,
        child: Center(
          child: Text(
            'Add Item ₹150',
            style: productDescriptionStyle.copyWith(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
