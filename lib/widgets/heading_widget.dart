import 'package:flutter/material.dart';

import '../constants/constant.dart';

class headingWidget extends StatelessWidget {
  const headingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: screenSize.height * .05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Time Favorite ❤️',
            style: labelTitleStyle.copyWith(
              fontSize: 17,
            ),
          ),
          Text(
            'See all',
            style: labelTitleStyle.copyWith(
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
