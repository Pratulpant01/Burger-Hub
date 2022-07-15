// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/view/product/product_screen.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/button/round_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addQuantityWidget extends StatefulWidget {
  bool isMargin;
  addQuantityWidget({
    Key? key,
    this.isMargin = false,
  }) : super(key: key);

  @override
  State<addQuantityWidget> createState() => _addQuantityWidgetState();
}

class _addQuantityWidgetState extends State<addQuantityWidget> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.isMargin ? null : EdgeInsets.symmetric(horizontal: 10),
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
              setState(() {
                context.read<AddQuantityBloc>().add(DecrementQuantityEvent());
              });
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
                        '${state.quantity}',
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
              setState(() {
                context.read<AddQuantityBloc>().add(IncrementQuantityEvent());
              });
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
