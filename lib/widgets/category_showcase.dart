import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class categoryShowcase extends StatelessWidget {
  const categoryShowcase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        height: screenSize.height * .05,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Recommended',
            style: categoryTitleStyle,
          ),
        ),
      ),
    );
  }
}
