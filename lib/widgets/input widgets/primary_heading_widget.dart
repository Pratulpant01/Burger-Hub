import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class primaryHeadingWidget extends StatelessWidget {
  String title;

  primaryHeadingWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: labelTitleStyle.copyWith(
        fontSize: 17,
      ),
    );
  }
}
