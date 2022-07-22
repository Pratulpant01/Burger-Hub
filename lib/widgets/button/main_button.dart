import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class MainButton extends StatelessWidget {
  VoidCallback onTap;
  String buttonName;

  MainButton({
    Key? key,
    required this.onTap,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        height: screenSize.width * .14,
        child: Center(
          child: Text(
            buttonName,
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
