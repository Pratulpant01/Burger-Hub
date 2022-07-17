// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/view/product/product_screen.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/button/round_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addQuantityWidget extends StatelessWidget {
  bool isMargin;
  String productId;
  addQuantityWidget({
    Key? key,
    this.isMargin = false,
    required this.productId,
  }) : super(key: key);

  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isMargin ? null : EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context
                  .read<AddQuantityBloc>()
                  .add(DecrementQuantityEvent(productId));
            },
            icon: Icon(
              Icons.remove,
              color: secondaryColor,
            ),
          ),
          Builder(builder: (context) {
            return FittedBox(
              child: BlocBuilder<AddQuantityBloc, AddQuantityState>(
                builder: (context, state) {
                  return Container(
                    child: Center(
                      child: Text(
                        state.quantity.toString(),
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
          IconButton(
            onPressed: () {
              context
                  .read<AddQuantityBloc>()
                  .add(IncrementQuantityEvent(productId));
            },
            icon: Icon(
              Icons.add,
              color: secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
