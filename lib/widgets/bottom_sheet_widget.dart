// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'button/add_quantity_widget.dart';
import 'button/primary_button.dart';

class bottomSheet_widget extends StatelessWidget {
  int price;
  bottomSheet_widget({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.shade400,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          addQuantityWidget(),
          priceButton(
            quantity: 1,
            price: price,
          ),
        ],
      ),
    );
  }
}
