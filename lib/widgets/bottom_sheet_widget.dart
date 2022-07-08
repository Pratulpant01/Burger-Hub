import 'package:flutter/material.dart';

import 'button/add_quantity_widget.dart';
import 'button/primary_button.dart';

class bottomSheet_widget extends StatelessWidget {
  const bottomSheet_widget({
    Key? key,
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
          primaryButton(),
        ],
      ),
    );
  }
}
