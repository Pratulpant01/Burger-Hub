import 'package:flutter/material.dart';

import '../../view/product/product_screen.dart';

class timeWidget extends StatelessWidget {
  const timeWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProductScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text('${widget.product.time} min'),
    );
  }
}
