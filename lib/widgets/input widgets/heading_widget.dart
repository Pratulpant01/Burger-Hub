// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class headingWidget extends StatelessWidget {
  String title;

  headingWidget({
    Key? key,
    required this.title,
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
            title,
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