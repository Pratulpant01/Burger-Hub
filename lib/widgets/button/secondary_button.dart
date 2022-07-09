import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class secondaryButton extends StatelessWidget {
  String buttonName;
  VoidCallback onTap;
  secondaryButton({
    Key? key,
    required this.buttonName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 18),
        height: screenSize.height * .06,
        width: screenSize.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            buttonName,
            style: productTitleStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
