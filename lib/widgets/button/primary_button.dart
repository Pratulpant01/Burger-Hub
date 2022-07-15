// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Add Quantity Bloc/add_quantity_bloc.dart';

class priceButton extends StatelessWidget {
  int price;
  int quantity;
  priceButton({
    Key? key,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          int quantity =
              BlocProvider.of<AddQuantityBloc>(context).state.quantity;
          print(quantity);
        },
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
              'Add Item  ₹$price',
              style: productDescriptionStyle.copyWith(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
